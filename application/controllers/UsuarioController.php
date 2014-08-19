<?php

/**
 * Controller de Usuário
 *
 * @package Pronatec
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class UsuarioController extends Zend_Controller_Action
{
    private $modelUsuario;

    public function init()
    {   
        //Verificação de login
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('autenticacao');
        }
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelUsuario = new Application_Model_Usuario();
    }

    /*
     * Lista todos os usuários
     */
    public function indexAction()
    {
        $dados = $this->modelUsuario->select('usu_deletado IS NULL');

        $this->view->assign("dados", $dados);
    }

    /*
     * Exibe formulário para cadastro de um usuário
     */
    public function novoAction()
    {
        $modelPerfil = new Application_Model_Perfil();
        $perfis = $modelPerfil->select();

        $this->view->assign("perfis", $perfis);
    }

    /*
     * Cadastra um usuário
     */
    public function criarAction()
    {
        $this->modelUsuario->insert($this->_getAllParams());

        $this->_redirect('usuario/index');
    }

    /*
     * Preenche um formulario com as informações de um usuário
     */
    public function editarAction()
    {
        $modelPerfil = new Application_Model_Perfil();
        $perfis = $modelPerfil->select();
        
        $usuario = $this->modelUsuario->find($this->_getParam('id'));

        $this->view->assign("perfis", $perfis);
        $this->view->assign("usuario", $usuario);
    }

    /*
     * Atualiza os dados do usuário
     */
    public function atualizarAction()
    {
        $this->modelUsuario->update($this->_getAllParams());

        $this->_redirect('usuario/index');
    }

    /*
     * Exclui um usuário
     */
    public function excluirAction()
    {
        $this->modelUsuario->delete($this->_getParam('id'));

        $this->_redirect('usuario/index');        
    }

}