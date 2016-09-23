<?php
$host='http://localhost/my-oauth2/resource.php';
    $username="testclient";
    $password="testpass";
    $token=$_GET['code'];
$process = curl_init($host);

curl_setopt($process, CURLOPT_HEADER, 0);

curl_setopt($process, CURLOPT_TIMEOUT, 30);
curl_setopt($process, CURLOPT_POST, 1);
curl_setopt($process, CURLOPT_POSTFIELDS, 'access_token='.$token);
curl_setopt($process, CURLOPT_RETURNTRANSFER, TRUE);
$return = curl_exec($process);
curl_close($process);

print_r($return);


function call3($host) {
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $host . '?&response_type=code&client_id=11&state=xyz');

    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
//  curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true); 
    curl_setopt($ch, CURLOPT_TIMEOUT, '3');
    $data = curl_exec($ch);

    curl_close($ch);

    curl_getinfo($ch, CURLINFO_EFFECTIVE_URL);


    return $data;
}
?>

