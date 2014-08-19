<?php

/**
 * Controller de Turma
 *
 * @package Pronatec
 * @subpackage Controllers
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class TurmaController extends Zend_Controller_Action
{

    private $modelTurma;

    public function init()
    {   
        //Verificação de login
        if(!Zend_Auth::getInstance()->hasIdentity()){
            $this->_redirect('autenticacao');
        }
        
        $this->usuarioLogado = Zend_Auth::getInstance()->getIdentity();
        $this->view->usuarioLogado = $this->usuarioLogado;
        
        $this->modelTurma = new Application_Model_Turma();
        
        date_default_timezone_set('America/Bahia');
    }

    /*
     * Lista todos os turmas
     */
    public function indexAction()
    {
        $dados = $this->modelTurma->select('tur_deletado IS NULL');

        $this->view->assign("dados", $dados);
    }

    /*
     * Exibe formulário para cadastro de um turma
     */
    public function novoAction()
    {
        $modelCurso = new Application_Model_Curso();
        $cursos = $modelCurso->select('cur_deletado IS NULL');
        
        $modelUnidadeEnsino = new Application_Model_UnidadeEnsino();
        $unidades = $modelUnidadeEnsino->select('uni_deletado IS NULL');

        $this->view->assign("cursos", $cursos);
        $this->view->assign("unidades", $unidades);
    }

    /*
     * Cadastra um turma
     */
    public function criarAction()
    {
        $modelExcel = new Application_Model_Excel();
        $resultado = $modelExcel->upload($_FILES['arquivo']);
        
        if (is_string($resultado))
        {
            $tur_id = $this->modelTurma->insert($this->_getAllParams());
            
            $modelAluno = new Application_Model_Aluno();
            
            $arrayAlunos = $modelExcel->importarDadosExcel($resultado);
            
            $modelAluno->insertAlunos($arrayAlunos, $tur_id);            

            $this->_redirect('turma/index');            
        } elseif ($resultado == 3) {
             $this->view->assign("erro", "<strong>Erro:</strong> Não foi possível enviar o arquivo, tente novamente.");        
        } elseif ($resultado == 2) {
             $this->view->assign("erro", "<strong>Erro:</strong> O arquivo enviado é muito grande, envie arquivos de até 2Mb.");        
        } elseif ($resultado == 1) {
             $this->view->assign("erro", "<strong>Erro:</strong> Por favor, envie arquivos com a extensão xlsx.");        
        } else {
            $this->view->assign("erro", "<strong>Erro:</strong> Não foi possível fazer o upload."); 
        }
                
    }
    
    /*
     * Visualiza um turma
     */
    public function visualizarAction()
    {
        $modelAluno = new Application_Model_Aluno();
        
        $tur_id = $this->_getParam('id');
        
        $turma = $this->modelTurma->find($tur_id);
        $alunos = $modelAluno->select("tur_id = $tur_id");
        
        $this->view->assign("turma", $turma);
        $this->view->assign("alunos", $alunos);
    }

    /*
     * Preenche um formulario com as informações de um turma
     */
    public function editarAction()
    {
        $modelPerfil = new Application_Model_Perfil();
        $perfis = $modelPerfil->select();
        
        $turma = $this->modelTurma->find($this->_getParam('id'));

        $this->view->assign("perfis", $perfis);
        $this->view->assign("turma", $turma);
    }

    /*
     * Atualiza os dados do turma
     */
    public function atualizarAction()
    {
        $this->modelTurma->update($this->_getAllParams());

        $this->_redirect('turma/index');
    }

    /*
     * Exclui um turma
     */
    public function excluirAction()
    {
        $this->modelTurma->delete($this->_getParam('id'));

        $this->_redirect('turma/index');        
    }

}
