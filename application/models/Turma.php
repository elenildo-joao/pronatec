<?php

/**
 * Model Turma
 *
 * @package Pronatec
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_Turma
{
    private $turma;
    private $vTurma;
    
    public function __construct() {
        $this->turma = new Application_Model_DbTable_Turma();     
        $this->vTurma = new Application_Model_DbTable_VTurma();    
    }

    public function select($where = null, $order = 'tur_nome ASC', $limit = null) {
        $select = $this->vTurma->select()->from($this->vTurma)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $this->vTurma->fetchAll($select)->toArray();
    }

    public function find($id) {
        $arr = $this->vTurma->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert($dados) {
        $dadosTurma = array(
            'tur_nome' => $dados['nome'],
            'tur_data_inicio' => $dados['data_inicio'],
            'tur_data_fim' => $dados['data_fim'],
            'cur_id' => $dados['cur_id'],
            'uni_id' => $dados['uni_id']
        );

        return $this->turma->insert($dadosTurma);
    }

    public function update(array $dados) {
        $dadosTurma = array(
            'tur_nome' => $dados['nome'],
            'tur_data_inicio' => $dados['data_inicio'],
            'tur_data_fim' => $dados['data_fim'],
            'cur_id' => $dados['cur_id'],
            'uni_id' => $dados['uni_id']
        );

        $whereTurma = $this->turma->getAdapter()->quoteInto('tur_id = ?', $dados['idTurma']);
        
        $this->turma->update($dadosTurma, $whereTurma);
    }

    public function delete($idTurma) {
        $dadosTurma = array(
            'tur_deletado' => TRUE
        );

        $whereTurma = $this->turma->getAdapter()->quoteInto('tur_id = ?', $idTurma);

        $this->turma->update($dadosTurma, $whereTurma);
    }

}