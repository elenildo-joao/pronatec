<?php

/**
 * Model UnidadeEnsino
 *
 * @package Pronatec
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
class Application_Model_UnidadeEnsino {
    private $unidadeEnsino;
    
    public function __construct() {
        $this->unidadeEnsino = new Application_Model_DbTable_UnidadeEnsino();       
    }

    public function select($where = null, $order = 'uni_nome ASC', $limit = null) {
        $select = $this->unidadeEnsino->select()->from($this->unidadeEnsino)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $this->unidadeEnsino->fetchAll($select)->toArray();
    }

    public function find($id) {
        $arr = $this->unidadeEnsino->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert($dados) {
        $dadosUnidadeEnsino = array(
            'uni_nome' => $dados['nome']
        );

        return $this->unidadeEnsino->insert($dadosUnidadeEnsino);
    }

    public function update(array $dados) {
        $dadosUnidadeEnsino = array(
            'uni_nome' => $dados['nome']
        );

        $whereUnidadeEnsino = $this->unidadeEnsino->getAdapter()->quoteInto('uni_id = ?', $dados['idUnidadeEnsino']);
        
        return $this->unidadeEnsino->update($dadosUnidadeEnsino, $whereUnidadeEnsino);
        
    }

    public function delete($idUnidadeEnsino) {
        $dadosUnidadeEnsino = array(
            'uni_deletado' => TRUE
        );

        $whereUnidadeEnsino = $this->unidadeEnsino->getAdapter()->quoteInto('uni_id = ?', $idUnidadeEnsino);

        $this->unidadeEnsino->update($dadosUnidadeEnsino, $whereUnidadeEnsino);
    }

}