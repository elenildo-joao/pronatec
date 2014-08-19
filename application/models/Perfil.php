<?php

class Application_Model_Perfil
{
    private $dbTablePerfil;

    public function select($where = null, $order = null, $limit = null) {
        $this->dbTablePerfil = new Application_Model_DbTable_Perfil();

        $select = $this->dbTablePerfil->select()->from($this->dbTablePerfil)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $this->dbTablePerfil->fetchAll($select)->toArray();
    }

}