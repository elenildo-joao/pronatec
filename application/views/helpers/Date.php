<?php
/**
 * Formatação de Datas
 * Auxiliar da Camada de Visualização
 * @author Michael Helder
 * @see APPLICATION_PATH/views/helpers/Date.php
 */
class Zend_View_Helper_Date extends Zend_View_Helper_Abstract
{
    /**
     * Manipulador de Datas
     * @var Zend_Date
     */
    protected static $_date = null;

    /**
     * Método Principal
     * @param string $value Valor para Formatação
     * @param string $format Formato de Saída
     * @return string Valor Formatado
     */
    public function date($value, $format = Zend_Date::DATE_MEDIUM)
    {
        $date = $this->getDate();
        if($value)
            return $date->set($value)->get($format);
        else
            return false;
    }

    /**
     * Acesso ao Manipulador de Datas
     * @return Zend_Date
     */
    public function getDate()
    {
        if (self::$_date == null) {
            self::$_date = new Zend_Date();
        }
        return self::$_date;
    }
}
