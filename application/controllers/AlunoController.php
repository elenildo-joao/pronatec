<?php

/**
 * Controller de Aluno
 *
 * @package Pronatec
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class AlunoController extends Zend_Controller_Action
{

    private $modelAluno;

    public function init()
    {   
        //Verificação de login
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('autenticacao');
        }
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelAluno = new Application_Model_Aluno();
        
        date_default_timezone_set('America/Bahia');
    }

    public function indexAction()
    {
        
    }
        
    public function editarAction()
    {
        $aluno = $this->modelAluno->find($this->_getParam('id'));

        $this->view->assign("aluno", $aluno);
    }
    
    public function excluirAction()
    {
        
    }

}

