<?php
/**
 * Controller de UnidadeEnsino
 *
 * @package Pronatec
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
class UnidadeEnsinoController extends Zend_Controller_Action
{

    private $modelUnidadeEnsino;

    public function init()
    {   
        //Verificação de login
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('autenticacao');
        }
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelUnidadeEnsino = new Application_Model_UnidadeEnsino();
    }

    /*
     * Lista todas as unidades de ensino
     */
    public function indexAction()
    {
        $dados = $this->modelUnidadeEnsino->select('uni_deletado IS NULL');

        $this->view->assign("dados", $dados);
    }
    

    /*
     * Exibe formulário para cadastro de um unidadeEnsino
     */
    public function novoAction()
    {
        
    }

    /*
     * Cadastra um unidadeEnsino
     */
    public function criarAction()
    {
        $this->modelUnidadeEnsino->insert($this->_getAllParams());

        $this->_redirect('unidade-ensino/index');
    }

    /*
     * Preenche um formulario com as informações de um unidadeEnsino
     */
    public function editarAction()
    {        
        $unidadeEnsino = $this->modelUnidadeEnsino->find($this->_getParam('id'));

        $this->view->assign("unidadeEnsino", $unidadeEnsino);
    }

    /*
     * Atualiza os dados do unidadeEnsino
     */
    public function atualizarAction()
    {
        $this->modelUnidadeEnsino->update($this->_getAllParams());

        $this->_redirect('unidade-ensino/index');
    }

    /*
     * Exclui um unidadeEnsino
     */
    public function excluirAction()
    {
        $this->modelUnidadeEnsino->delete($this->_getParam('id'));

        $this->_redirect('unidade-ensino/index');        
    }
    
}