<?php
/**
 * Controller de Curso
 *
 * @package Pronatec
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class CursoController extends Zend_Controller_Action
{
    private $modelCurso;

    public function init()
    {   
        //Verificação de login
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('autenticacao');
        }
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelCurso = new Application_Model_Curso();
    }

    /*
     * Lista todos os usuários
     */
    public function indexAction()
    {
        $dados = $this->modelCurso->select('cur_deletado IS NULL');

        $this->view->assign("dados", $dados);
    }
    
    /*
     * Consulta um usuário
     */
    public function visualizarAction()
    {

        $idCurso = $this->_getParam('id');

        $curso = $this->modelCurso->find($idCurso);

        $this->view->assign("curso", $curso);
    }

    /*
     * Exibe formulário para cadastro de um curso
     */
    public function novoAction()
    {
        
    }

    /*
     * Cadastra um curso
     */
    public function criarAction()
    {
        $this->modelCurso->insert($this->_getAllParams());

        $this->_redirect('curso/index');
    }

    /*
     * Preenche um formulario com as informações de um curso
     */
    public function editarAction()
    {        
        $curso = $this->modelCurso->find($this->_getParam('id'));

        $this->view->assign("curso", $curso);
    }

    /*
     * Atualiza os dados do curso
     */
    public function atualizarAction()
    {
        $this->modelCurso->update($this->_getAllParams());

        $this->_redirect('curso/index');
    }

    /*
     * Exclui um curso
     */
    public function excluirAction()
    {
        $this->modelCurso->delete($this->_getParam('id'));

        $this->_redirect('curso/index');        
    }
    
}