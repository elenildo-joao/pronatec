<?php

/**
 * Model Login
 *
 * @package Pronatec
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */
class Application_Model_Login {
    private $login;
    
    public function __construct() {
        $this->login = new Application_Model_DbTable_Login();        
    }

    public function select($where = null, $order = null, $limit = null) {
        $select = $this->login->select()->from($this->login)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $this->login->fetchAll($select)->toArray();
    }

    public function find($id) {
        $arr = $this->login->find($id)->toArray();
        return $arr[0];
    }
    
    public function insert($login, $senha) {
        $dadosLogin = array(
            'log_login' => $login,
            'log_hash_senha' => sha1($senha)
        );

        return $this->login->insert($dadosLogin);
    }

    public function update(array $request) {
        $dbTableUsuario = new Application_Model_DbTable_Usuario();
        $dbTableEndereco = new Application_Model_DbTable_Endereco();

        $dadosEndereco = array(
            'te_logradouro' => $request['logradouro'],
            'te_numero' => $request['numero'],
            'te_bairro' => $request['bairro'],
            'te_cep' => $request['cep'],
            'te_comp' => $request['complemento'],
            'tmun_id' => $request['municipio']
        );

        $dadosUsuario = array(
            'tp_id' => $request['perfil'],
            'tu_nome' => $request['nome'],
            'tu_sexo' => $request['sexo'],
            'tu_rg' => $request['rg'],
            'tu_cpf' => $request['cpf'],
            'tu_email' => $request['email'],
            'tu_telres' => $request['telefoneResidencial'],
            'tu_telcel' => $request['telefoneCelular']
        );

        $whereUsuario = $dbTableUsuario->getAdapter()->quoteInto('"tu_id" = ?', $request['idUsuario']);
        $whereEndereco = $dbTableEndereco->getAdapter()->quoteInto('"te_id" = ?', $request['idEndereco']);

        $dbTableUsuario->update($dadosUsuario, $whereUsuario);
        $dbTableEndereco->update($dadosEndereco, $whereEndereco);
    }

    public function delete($idUsuario) {
        $dbTableUsuario = new Application_Model_DbTable_Usuario();

        $dadosUsuario = array(
            'tu_usuariodeletado' => TRUE
        );

        $whereUsuario = $dbTableUsuario->getAdapter()->quoteInto('"tu_id" = ?', $idUsuario);

        $dbTableUsuario->update($dadosUsuario, $whereUsuario);
    }

}