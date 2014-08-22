<?php

/**
 * Model Data
 *
 * @package Pronatec
 * @subpackage Models
 * @author Elenildo João <elenildo.joao@gmail.com>
 * @version 0.1
 * @access public
 *
 */

class Application_Model_Data
{
    
    public static function dataMysql($data){
        return implode('-' , array_reverse(explode('/', $data)));
    }
    
}