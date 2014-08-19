<?php

/**
 * Model Curso
 *
 * @package Pronatec
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
class Application_Model_Curso {
    private $curso;
    
    public function __construct() {
        $this->curso = new Application_Model_DbTable_Curso();        
    }

    public function select($where = null, $order = 'cur_nome ASC', $limit = null) {
        $select = $this->curso->select()->from($this->curso)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $this->curso->fetchAll($select)->toArray();
    }

    public function find($id) {
        $arr = $this->curso->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert($dados) {
        $dadosCurso = array(
            'cur_nome' => $dados['nome'],
            'cur_carga_horaria' => $dados['cargaHoraria']
        );

        return $this->curso->insert($dadosCurso);
    }

    public function update(array $dados) {
        $dadosCurso = array(
            'cur_nome' => $dados['nome'],
            'cur_carga_horaria' => $dados['cargaHoraria']
        );

        $whereCurso = $this->curso->getAdapter()->quoteInto('cur_id = ?', $dados['idCurso']);
        
        $this->curso->update($dadosCurso, $whereCurso);
    }

    public function delete($idCurso) {
        $dadosCurso = array(
            'cur_deletado' => TRUE
        );

        $whereCurso = $this->curso->getAdapter()->quoteInto('cur_id = ?', $idCurso);

        $this->curso->update($dadosCurso, $whereCurso);
    }

}