<?php

class Application_Model_Excel
{
    public function upload($arquivo) {
        
        $diretorio = 'importacao/';

        $tamanho = 1024 * 1024 * 2;

        $extensoes = array('xlsx');

        // Array com os tipos de erros de upload do PHP
        $_UP['erros'][0] = 'Não houve erro';
        $_UP['erros'][1] = 'O arquivo no upload é maior do que o limite do PHP';
        $_UP['erros'][2] = 'O arquivo ultrapassa o limite de tamanho especifiado no HTML';
        $_UP['erros'][3] = 'O upload do arquivo foi feito parcialmente';
        $_UP['erros'][4] = 'Não foi feito o upload do arquivo';

        // Verifica se houve algum erro com o upload. Se sim, exibe a mensagem do erro
        if ($arquivo['error'] != 0) {
            return 0;
        }

        // Caso script chegue a esse ponto, não houve erro com o upload e o PHP pode continuar

        // Faz a verificação da extensão do arquivo
        $extensao = strtolower(end(explode('.', $arquivo['name'])));
        if (array_search($extensao, $extensoes) === false) {
            return 1;
        }

        // Faz a verificação do tamanho do arquivo
        else if ($tamanho < $arquivo['size']) {
            return 2;
        }

        // O arquivo passou em todas as verificações, hora de tentar movê-lo para a pasta
        else {
            // Cria um nome baseado no UNIX TIMESTAMP atual e com extensão .jpg
            $nome_final = time().'.xlsx';

            // Depois verifica se é possível mover o arquivo para a pasta escolhida
            if (move_uploaded_file($arquivo['tmp_name'], $diretorio . $nome_final)) {
                return $nome_final;
            } else {
                // Não foi possível fazer o upload, provavelmente a pasta está incorreta
                return 3;
            }

        }
    }
    
    public function importarDadosExcel($arquivo) {
        /** automatically detect the correct reader to load for this file type */
        $excelReader = PHPExcel_IOFactory::createReaderForFile('importacao/' . $arquivo);

        //if we dont need any formatting on the data
        $excelReader->setReadDataOnly();

        $excelObj = $excelReader->load('importacao/' . $arquivo);
        $array = $excelObj->getActiveSheet()->toArray(null, true,true,true);

        for ($i = 1; $i <= 3; $i++) {
            unset($array[$i]);
        }

        return array_values($array);        
    }
    
    public function exportacao() {
        
    }

}

