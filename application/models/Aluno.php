<?php

class Application_Model_Aluno
{
    private $aluno;
    
    public function __construct() {
        $this->aluno = new Application_Model_DbTable_Aluno();        
    }
    
    public function insertAlunos($arrayAlunos, $tur_id) {
        foreach ($arrayAlunos as $aluno){            
            //Adicionando zeros à esquerda do CPF
            $numZeros = 11 - strlen($aluno['G']);
            
            for ($i = 0; $i < $numZeros; $i++) {
                $aluno['G'] = '0' . $aluno['G'];
            }
            
            $dadosAluno = array(
                'alu_nome'      => $aluno['E'],
                'alu_matricula' => $aluno['A'],
                'alu_telefone'  => $aluno['H'],
                'alu_celular'   => $aluno['I'],
                'alu_email'     => $aluno['J'],
                'alu_cpf'       => $aluno['G'],
                'tur_id'        => $tur_id
            );

            $this->aluno->insert($dadosAluno);
        }
    }
    
    public function select($where = null, $order = null, $limit = null) {
        $select = $this->aluno->select()->from($this->aluno)->order($order)->limit($limit);

        if (!is_null($where)) {
            $select->where($where);
        }

        return $this->aluno->fetchAll($select)->toArray();
    }
    
    public function find($id) {
        $arr = $this->aluno->find($id)->toArray();
        return $arr[0];
    }
}