<?php
// process.php
$errors = array();   // array to hold validation errors
$data = array();   // array to pass back data

// validate the variables ======================================================
    // if any of these variables don't exist, add an error to our $errors array

    if (empty($_POST['match_n']))
        $errors['match_n'] = 'Match ID Required';

    /*if (empty($_POST['score_l']))
        $errors['score_l'] = 'Score Local Required';

    if (empty($_POST['score_v']))
        $errors['score_v'] = 'Score Visita Required';
        */

// return a response ===========================================================
    // if there are any errors in our errors array, return a success boolean of false
    if ( ! empty($errors)) {
    // if there are items in our errors array, return those errors
        $data['success'] = false;
        $data['errors']  = $errors;
    } else {
        // if there are no errors process our form, then return a message
        // DO ALL YOUR FORM PROCESSING HERE
        // THIS CAN BE WHATEVER YOU WANT TO DO (LOGIN, SAVE, UPDATE, WHATEVER)
        
        $rootpath = $_SERVER['DOCUMENT_ROOT'];
        require_once($rootpath."/WorldCup2018-Pool/php_lib/MysqliDb.php");

        $db_conct = new MysqliDb (Array (
          'host' => 'localhost',
          'username' => 'root',
          'password' => '',
          'db'=> 'db_wc_russia2018',
          'port' => 3306,
          'prefix' => '',
          'charset' => 'utf8'));
        
        $tableName = 'matches_wc';
        
        $data = Array (
               'score_l' => $_POST['score_l'],
                'score_v' => $_POST['score_v']
                );
        
        $db_conct->where ('n', $_POST['match_n']);
        if ($db_conct->update ($tableName, $data)){
                $data['success'] = true;
                $data['message'] = 'Success!';
        }else{
            $data['message'] = 'Update failed: ' . $db_conct->getLastError();
        }
    }
    // return all our data to an AJAX call
    echo json_encode($data);
?>