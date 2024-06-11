<?php
############################################
#                                          #
#  ##  ##  ######  #####    ####   ##  ##  #
#   ####   ##      ##  ##  ##  ##  ### ##  #
#    ##    ####    #####   ##  ##  ## ###  #
#   ####   ##      ##  ##  ##  ##  ##  ##  #
#  ##  ##  #####   ##  ##   ####   ##  ##  #
#                                          #
############################################
#         http://vk.com/id18471769         #
############################################
#          Версия от 22.07.2013            #
############################################


class QIWI {
    public $iQiwiAccount, $aBalances = array( 'USD' => 0, 'RUB' => 0, 'EUR' => 0, 'KZT' => 0 );
    private $sCookies = null;
   
    public function __construct( $iQiwiAccount, $sPassword ) {
        
        # Получение токена авторизации :
        $sResponse = $this->request( 'auth/login.action', array( 'login' => '+'.$iQiwiAccount, 'password' => $sPassword ), array( CURLOPT_HEADER => true ) );
        
        # Сохранение cookies :
        $this->sCookies = self::parseCookies( $sResponse );
        
        # Парсинг данных токена :
        if( count( $sToken = explode( 'token":"', $sResponse ) ) < 2 )
            throw new Exception( 'error parse token 1' );
        $sToken = explode( '"', $sToken[1] );
        $sToken = $sToken[0];
        
        # Авторизация при помощи токена :
        $sResponse = $this->request( 'auth/login.action', array( 'login' => '+'.$iQiwiAccount, 'password' => $sPassword, 'loginToken' => $sToken ), array( CURLOPT_HEADER => true ) );

        # Сохранение cookies :
        $this->sCookies = self::parseCookies( $sResponse );
        
        # Проверка авторизации кошельком :
        if( ($aResponse = @json_decode( mb_substr( $sResponse, mb_strpos( $sResponse, '{' ) ), true )) === false )
            throw new Exception( 'internal error' );
        if( !isset( $aResponse['code'] ) || !isset( $aResponse['code']['value'] ) || $aResponse['code']['value'] != 0 )
            throw new Exception( isset( $aResponse['message'] ) ? $aResponse['message'] : 'authorize error' );
        
/*

        # Получение информации об qiwi.кошельке :
        if( ($aResponse = @json_decode( $this->request( 'person/state.action' ), true )) === false )
            throw new Exception( 'fatal error' );
        if( !is_array( $aResponse['data'] ) || !isset( $aResponse['data']['person'] ) || !isset( $aResponse['data']['balances'] ) )
            throw new Exception( $aResponse );
        $this->iQiwiAccount = $aResponse['data']['person'];
        foreach( $aResponse['data']['balances'] as $sEquivalent => $dBalance )
            $this->aBalances[$sEquivalent] = $dBalance;
*/
    }
    public function GetHistory( $sStartDate, $sFinishDate ) {
        
        # Получение списка транзакций :
        $sResult = $this->request( 'user/report/list.action?daterange=true&start='.$sStartDate.'&finish='.$sFinishDate );
 
        $aTransactions = array();
        foreach( explode( '</div><div class="reportsLine ', str_replace( '> <', '><', preg_replace( '!\s+!u', ' ', $sResult ) ) ) as $iKey => $sValue ) {
            if( $iKey == 0 )
                continue;
            
            $aData = array();
            
            # Получение суммы счета :
            $aData['iID'] = explode( 'class="transaction">', $sValue );
            if( count( $aData['iID'] ) < 2 )
                continue;
            $aData['iID'] = explode( '</', $aData['iID'][1] );
            $aData['iID'] = trim( $aData['iID'][0] );
            
            # Получение даты и время :
            $aData['sDate'] = explode( 'class="date">', $sValue );
            $aData['sDate'] = explode( '</', $aData['sDate'][1] );
            $aData['sDate'] = trim( $aData['sDate'][0] );
            $aData['sTime'] = explode( 'class="time">', $sValue );
            $aData['sTime'] = explode( '</', $aData['sTime'][1] );
            $aData['sTime'] = trim( $aData['sTime'][0] );
            
            # Получение суммы и валюты счета :
            $aData['sAmount'] = explode( 'class="originalExpense"><span>', $sValue );
            $aData['sAmount'] = explode( '</', $aData['sAmount'][1] );
            $aData['sAmount'] = trim( $aData['sAmount'][0] );
            
            # Получение суммы счета :
            $aData['dAmount'] = preg_replace( '/[^0-9\.]+/', '', str_replace( ',', '.', $aData['sAmount'] ) ) - 0;
            
            # Получение валюты счета :
            $aData['sCurrency'] = mb_strpos( $aData['sAmount'], 'руб.' ) !== false ? 'RUB' : (mb_strpos( $aData['sAmount'], 'долл.' ) !== false ? 'USD' : (mb_strpos( $aData['sAmount'], 'тенге.' ) !== false ? 'KZT' : 'NAN'));
            
            # Получение номера телефона корреспондента :
            $aData['iOpponentPhone'] = explode( 'class="opNumber">', $sValue );
            $aData['iOpponentPhone'] = explode( '</', $aData['iOpponentPhone'][1] );
            $aData['iOpponentPhone'] = trim( str_replace( '+', '', $aData['iOpponentPhone'][0] ) );
            
            # Получение примечания :
            $aData['sComment'] = explode( 'class="comment">', $sValue );
            $aData['sComment'] = explode( '</', $aData['sComment'][1] );
            $aData['sComment'] = html_entity_decode( trim( $aData['sComment'][0] ), ENT_QUOTES, 'UTF-8' );
            
            # Прибыль или расход ?
            $aData['sType'] = mb_strpos( $sValue, 'IncomeWithExpend expenditure' ) !== false ? 'EXPENDITURE' : (mb_strpos( $sValue, 'IncomeWithExpend income' ) !== false ? 'INCOME' : 'NAN');
            
            # Получение статуса транзакции :
            $aData['sStatus'] = explode( '"', $sValue );
            $aData['sStatus'] = trim( $aData['sStatus'][0] );
            
            # Дополнительные проверки :
            if( $aData['iID'] == false ) {
                $aData['iID'] = explode( '{"txn":', $sValue );
                $aData['iID'] = explode( '}', $aData['iID'][1] );
                $aData['iID'] = $aData['iID'][0];
            }
            
            $aTransactions['ID-'.$aData['iID']] = $aData;
        }
        return $aTransactions;
    }
    private function request( $sPath, $mPOST = null, $aOptions = array() ) {
        $oCURL = curl_init( 'https://w.qiwi.com/'.$sPath );
        curl_setopt_array( $oCURL, array(
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_COOKIE => $this->sCookies,
            CURLOPT_USERAGENT => 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:22.0) Gecko/20100101 Firefox/22.0',
            CURLOPT_HTTPHEADER => array( 
                'Accept: application/json, text/javascript, */*; q=0.01', 
                'X-Requested-With: XMLHttpRequest'
            ),
            CURLOPT_SSL_VERIFYPEER => false,
            CURLOPT_SSL_VERIFYHOST => false
        ) );
        if( !is_null( $mPOST ) )
            curl_setopt_array( $oCURL, array(
                CURLOPT_POST => true,
                CURLOPT_POSTFIELDS => is_array( $mPOST ) ? http_build_query( $mPOST ) : $mPOST,
            ) );
        if( count( $aOptions ) )
            curl_setopt_array( $oCURL, $aOptions );
        $sResponse = curl_exec( $oCURL );
        if( $sResponse === false || curl_errno( $oCURL ) != 0 )
            throw new Exception( curl_error( $oCURL ), curl_errno( $oCURL ) );
        curl_close( $oCURL );
        return $sResponse;
    }
    private static function parseCookies( $sXML ) {
        $aCookies = array();
        preg_match_all( '|Set-Cookie: (.*);|U', $sXML, $aCookies );
        return implode( ';', $aCookies[1] );
    }




    function check_qiwi($qiwi_num,$qiwi_pass) {
        try {
            $qiwi = new QIWI($qiwi_num,$qiwi_pass);
        } catch (Exception $e) {
            die($e->getMessage());
        }
        return true;
    }



    function qiwi_pay($qiwi_num,$qiwi_pass,$bill,$price) {
        $date1 = date('d.m.Y',strtotime('-2 day'));
        $date2 = date('d.m.Y',strtotime('+1 day'));
        $operations = $this->GetHistory($date1,$date2);
        $result = false;
        foreach($operations as $operation)
        {
            if(number_format($operation['dAmount'], 2, '.', '') == $price && $operation['sComment'] == $bill && $operation['sStatus'] == 'SUCCESS')
            {
                $result = $operation;
            }
        }
        return $result;
    }


}