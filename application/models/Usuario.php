<?php

/**
 * Model Usuario
 *
 * @package Pronatec
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
class Application_Model_Usuario {
    //DbTables
    private $usuario;
    private $vUsuario;
    
    public function __construct() {
        $this->usuario = new Application_Model_DbTable_Usuario();
        $this->vUsuario = new Application_Model_DbTable_VUsuario();
    }

    public function select($where = null, $order = null, $limit = null) {
        $select = $this->vUsuario->select()->from($this->vUsuario)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $this->vUsuario->fetchAll($select)->toArray();
    }
    
    public function find($id) {
        $arr = $this->vUsuario->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert(array $dados) {
        $modelLogin = new Application_Model_Login();

        $idLogin = $modelLogin->insert($dados['login'], $dados['login']);

        $dadosUsuario = array(
            'usu_nome' => $dados['nome'],
            'usu_email' => $dados['email'],
            'usu_telefone' => $dados['telefone'],
            'per_id' => $dados['per_id'],
            'uni_id' => $dados['uni_id'],
            'log_id' => $idLogin
        );

        $this->usuario->insert($dadosUsuario);

        return;
    }

    public function update(array $dados) {        
        $dadosUsuario = array(
            'usu_nome' => $dados['nome'],
            'usu_email' => $dados['email'],
            'usu_telefone' => $dados['telefone'],
            'per_id' => $dados['per_id'],
            'uni_id' => $dados['uni_id']
        );

        $whereUsuario = $this->usuario->getAdapter()->quoteInto('usu_id = ?', (int) $dados['idusuario']);
        
        $this->usuario->update($dadosUsuario, $whereUsuario);
        
        return;
    }

    public function delete($idUsuario) {
        $dadosUsuario = array(
            'usu_deletado' => 1
        );

        $whereUsuario = $this->usuario->getAdapter()->quoteInto('usu_id = ?', $idUsuario);

        $this->usuario->update($dadosUsuario, $whereUsuario);
    }

}