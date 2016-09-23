<?php
$host='http://localhost/my-oauth2/authorize.php';
//http://localhost/my-oauth2/authorize.php?response_type=code&client_id=testclient&state=xyz
 $client_id="testclient";
 
         
$process = curl_init($host);

curl_setopt($process, CURLOPT_HEADER, 0);
//curl_setopt($process, CURLOPT_USERPWD, $username . ":" . $password);
curl_setopt($process, CURLOPT_TIMEOUT, 30);
curl_setopt($process, CURLOPT_POST, 1);
curl_setopt($process, CURLOPT_POSTFIELDS, 'response_type=code&client_id=&'.$client_id.'&state=xyz');
curl_setopt($process, CURLOPT_RETURNTRANSFER, TRUE);
$return = curl_exec($process);
curl_close($process);

$json=json_decode($return);

 print_r($json);
?>
 
