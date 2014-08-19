<?php

/**
 * Controller de autenticação
 *
 * @package Pronatec
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
class AutenticacaoController extends Zend_Controller_Action {

    public function init() {
        
    }

    public function indexAction() {
        
    }

    /*
     * Login de usuários
     */
    public function loginAction() {
        $login = $this->_getParam('login');
        $senha = $this->_getParam('senha');

        if (empty($login) || empty($senha)) {
            $this->_redirect('autenticacao/falha');
        } else {
            $this->_helper->viewRenderer->setNoRender();

            $dbAdapter = Zend_Db_Table_Abstract::getDefaultAdapter();
            $authAdapter = new Zend_Auth_Adapter_DbTable($dbAdapter);

            $authAdapter->setTableName('login')->setIdentityColumn('log_login')->setCredentialColumn('log_hash_senha');

            $authAdapter->setIdentity($login)->setCredential(sha1($senha));

            $result = $authAdapter->authenticate();

            if ($result->isValid()) {
                $usuarioObj = $authAdapter->getResultRowObject();

                $storage = Zend_Auth::getInstance()->getStorage();
                
                $modelUsuario = new Application_Model_Usuario();
                $usuario = $modelUsuario->find($usuarioObj->log_id);
                
                $usuarioObj->usu_nome = $usuario['usu_nome'];
                $usuarioObj->usu_email = $usuario['usu_email'];
                $usuarioObj->per_id = $usuario['per_id'];  
                $usuarioObj->per_perfil = $usuario['per_perfil'];             
                
                $storage->write($usuarioObj);
                
                $this->_redirect('index');
            } else {
                $this->_redirect('autenticacao/falha');
            }
        }
    }

    /*
     * Logout de usuários
     */
    public function logoutAction() {
        Zend_Auth::getInstance()->clearIdentity();

        $this->_redirect('autenticacao');
    }
    
    public function falhaAction() {
        
    }

}