<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;" />-->
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=yes">
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <!--[if lt IE 8]>
  <link rel="stylesheet" type="text/css" href="/css/ie.css" media="screen, projection" />
  <![endif]-->
    <link rel="shortcut icon" type="image/ico" href="http://paneldemo.oneplace.mx/themes/zicepanel_flat/images/favicon.ico" />
    <link rel="stylesheet" type="text/css" href="http://paneldemo.oneplace.mx/themes/zicepanel_flat/css/zice.style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
    <style>
        @page {
            size: Letter landscape;
            size: auto;
            /* es el valor por defecto */
            margin: 10%;
        }

        h3 {
            margin: 0;
            padding: 0;
            font-weight: bold;
            color: #666;
            font-size: 20px;
            font-family: "Myriad Pro", Arial, Helvetica, sans-serif;
            text-transform: uppercase;
            border-bottom: 1px #eeeeee solid;
            /*margin-bottom: 13px;
        line-height: 35px;*/
        }

        table {
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid #ccc;
        }

        .ply_font {
            font-family: "Myriad Pro", Arial, Helvetica, sans-serif;
            font-size: 14px;
            font-size: bold;
        }

        #matches_table {
            position: relative;
            /*top: 0px;
            bottom: 0px;
            left: 0px;*/
            /*width: 70%;*/
        }

        input {
            text-align: center;
        }
        
        #td-ok {background-color: forestgreen;
                color:white;
                font-weight: bold;
                border: 1px solid black;} 
        #aciertos{
            color:darkred;
            font-weight: bold;
        }
</style>
    
<script>
    var idPlayer;
    var match_n;
    var goles_l;
    var goles_v;
    var paramsCount = 0;

function setIDPlayer(idPlay){
    this.idPlayer = idPlay;
}

function getIDPlayer(){
    return this.idPlayer;
}

function setMatchN(idMatch){
    this.match_n = idMatch;
}

function getMatchN(){
    return this.match_n;
}

function setGoalsL(idGoalsL){
    this.goles_l = idGoalsL;
}

function getGoalsL(){
    return this.goles_l;
}

function setGoalsV(idGoalsV){
    this.goles_v = idGoalsV;
}

function getGoalsV(){
    return this.goles_v;
}
  
//******************************************************
function storeData(nPlayer,idMatch,goalsL,goalsV){
    
    $.ajax({
		type: 'POST',
		url: 'exec-update.php',
		data: {
        'n': nPlayer,
        'match_n': idMatch,
        'score_l': goalsL,
        'score_v': goalsV
        }, 
		dataType: 'json',
		encode: true,
		success:function(data){
			alert(JSON.stringify(data));
		  }
	   });   
}
    
$(document).ready(function() {
    $("#submitForm").click(function(event) {
        
    var x = $("#formf").serializeArray();
        $.each(x, function(i, field) {
            
            
        
        });
    });    
});

</script>
</head>
<body>
<?php
    
    $resultsArrayFinal = Array();
    $selectionsPlayer = Array();

   function setResultsArray($arrayResults){
        $resultsArrayFinal = $arrayResults;
    }
    
    function setChoisesARray($arrayChoises){
        $selectionsPlayer = $arrayChoises;
    }
    
    function getResultsArray(){
        return $resultsArrayFinal;
    }
    
    /*function getChoisesPlayer($idPlayer){
        return this.selectionsPlayer;
    }*/
function connectStart(){
    $rootpath = $_SERVER['DOCUMENT_ROOT'];
    require_once($rootpath."/CRM-Casona/php_lib/MysqliDb.php");
    
    $db_conct = new MysqliDb (Array (
      'host' => 'localhost',
      'username' => 'root',
      'password' => '',
      'db'=> 'db_wc_russia2018',
      'port' => 3306,
      'prefix' => '',
      'charset' => 'utf8'));
    
 return $db_conct;
}
    
function getUserName($idUser){    
    $dbC = connectStart();
    $par = Array($idUser);
    
    $user = $dbC->rawQueryValue ('SELECT name_player FROM contest_wc WHERE n=? limit 1', $par);
   
    $dbC->disconnect();
    
    return $user;
}

function generateFinalPlanillaByUser($idPlayer){
    $db_conct = connectStart();
    $tableResults = 'selections_wc';
    $arryCols = Array("n","match_n","score_l","score_v");
    
    $result_planilla = array();
    $params = Array($idPlayer);
    $inc = 0;
    
$goalsUser = $db_conct->rawQuery("SELECT score_l, score_v FROM selections_wc WHERE n=?", $params);
    
foreach ($goalsUser as $user) {
    
if(!is_null($user['score_l']) && !is_null($user['score_l'])){
            if($user['score_l'] == $user['score_v']){
                $result_planilla[$inc] = 'E';
                //empate
                }else{
                if($user['score_l'] > $user['score_v']){
                //local
                    $result_planilla[$inc] = 'L';
                }else{
                //visita
                    $result_planilla[$inc] = 'V';
                }
            }
        }else{
             $result_planilla[$inc] = '';
        }
             $inc ++;
        }
    $db_conct->disconnect();
    
    return $result_planilla;
}
    
function testFinal(){

    $db_conct = connectStart();
    $tableResults = 'matches_wc';
    $arryCols = Array("n","score_l","score_v");
    
$inc = 0;
$result_vals = array();

$goalsMatchs = $db_conct->get ($tableResults, null, $arryCols);
        
foreach ($goalsMatchs as $user) {
if(!is_null($user['score_l']) && !is_null($user['score_l']))  {  

            if($user['score_l'] == $user['score_v']){
                $result_vals[$inc] = 'E';
                
                echo($user['score_l']." vs ".$user['score_v']);
                echo("> ".$result_vals[$inc]);
                
                //empate
                }else{
                if($user['score_l'] > $user['score_v']){
                //local
                    $result_vals[$inc] = 'L';
                
                echo($user['score_l']." vs ".$user['score_v']);
                echo("> ".$result_vals[$inc]);
                    
                }else{
                //visita
                    $result_vals[$inc] = 'V';
                    
                echo($user['score_l']." vs ".$user['score_v']);
                echo("> ".$result_vals[$inc]);
                }
            }
            echo("<br>");
        }else{
             $result_vals[$inc] = '';
        }
             $inc ++;
        }
    $db_conct->disconnect();
    
return $result_vals;
    }
    
//*******************    
function generateFinalResultsArray(){

    $db_conct = connectStart();
    $tableResults = 'matches_wc';
    $arryCols = Array("n","score_l","score_v");
    
$inc = 0;
$result_vals = array();

$goalsMatchs = $db_conct->get ($tableResults, null, $arryCols);
        
foreach ($goalsMatchs as $user) {
if(!is_null($user['score_l']) && !is_null($user['score_l']))  {  

            if($user['score_l'] == $user['score_v']){
                $result_vals[$inc] = 'E';
                //empate
                }else{
                if($user['score_l'] > $user['score_v']){
                //local
                    $result_vals[$inc] = 'L';
                }else{
                //visita
                    $result_vals[$inc] = 'V';
                }
            }
        }else{
             $result_vals[$inc] = '';
        }
             $inc ++;
        }
    $db_conct->disconnect();
    
return $result_vals;
    }
    
function displayFinalResultsArray($arr){
    for($i = 0 ; $i < sizeof($arr); $i++){
        echo("<td><b>".$arr[$i]."</b></td>");
    }
    echo("<td></td>");
}

function displayFinalPlanillaArray($arr,$playerName){
     echo("<tr><td><b>".$playerName."</b></td>");
    for($i = 0 ; $i < sizeof($arr); $i++){
        echo("<td><b>".$arr[$i]."</b></td>");
    }
    echo("</tr>");
}
    
function displayOkSelections($arrResultados,$arraySelections,$playerName){
    $aciertos = 0;
    echo("<tr><td><b>".$playerName."</b></td>");
    
    for($i = 0 ; $i < sizeof($arrResultados); $i++){
        if($arrResultados[$i] == $arraySelections[$i]){
            $aciertos++;
             echo("<td id='td-ok'><b>".$arraySelections[$i]."</b></td>");
        }else{
            echo("<td><b>".$arraySelections[$i]."</b></td>");
        }
    }
     echo("<td id='aciertos'>".$aciertos."</td>");
    storeCorrectsFromPlanillas($playerName,$aciertos);
     echo("</tr>");
}
    
function storeCorrectsFromPlanillas($playerName,$aciertos){
        $db_conct = connectStart();
        $tableName = 'contest_wc';
        
        $data = Array (
               'points_player' => $aciertos
                );

        $db_conct->where ('name_player', $playerName);
    
        if ($db_conct->update($tableName, $data)){
                $data['success'] = true;
                $data['message'] = 'Success!';
        }else{
            $data['message'] = 'Update failed: ' . $db_conct->getLastError();
        }
   $db_conct->disconnect();
}
    
        
function displayPlayers(){
    $db_conct = connectStart();
    $arryCols = Array("n","name_player");
    $tableName = 'contest_wc';
    if ($db_conct->getLastErrno() === 0)
      echo 'Succesfull';
    $users = $db_conct->get($tableName,10,$arryCols);
        if ($db_conct->count > 0){
            foreach ($users as $user) {
                echo("<option value='".$user['n']."'>".$user['name_player']."</option>");
                }
     }else{
          echo 'Failed. Error: -> '. $db_conct->getLastError() . '</br>';
        }
    $db_conct->disconnect();
    }
?>
<h2>World Cup Russia 2018 - FIFA - Resumen de Planillas</h2>
<div id="container">

    <div class="row">
        <div class="col s7" id="matches_table">
            <form id="formf" action="">
                <table>
                    <tbody>
                        <tr>
                            <td>
                                <h3>Listado de Resultados</h3>
                            </td>
                        </tr>
                        <tr>
                            <!-- 
                            <td>xsss-->
                                
                            <?php /*testFinal();*/?>
                                
                          <!--   </td>xsss -->
                            
                            <td>
                                
                                <table>
                                    <thead>
                                    <th></th>
                                    </thead>
                                    <tbody>
                                    <tr>
                                <td><b>Oficiales</b></td>
                        <?php 
                        $arr = generateFinalResultsArray();
                               displayFinalResultsArray($arr); 
                                            ?>
                                    </tr>
                               <!--         <tr> -->
                <?php 
                for($ply = 1; $ply <=10; $ply++){
                        $arrx = generateFinalPlanillaByUser($ply);
                //displayFinalPlanillaArray($arrx,getUserName($ply));
                    
                displayOkSelections($arr,$arrx,getUserName($ply)); 
                    
                }
                                        ?>      
                                 <!--       </tr>  -->
                                     
                                    </tbody>
                                </table>
                                
                            </td>
                        </tr>
                </tbody>
            </table>
        </form>
        </div>
    </div>
        <div class="row">
            <div id="results" name="results">
                
            </div>
        </div>
    </div><!-- CONTAINER -->
</body>
</html>