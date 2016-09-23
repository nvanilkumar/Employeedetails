<?php
$host='http://localhost/my-oauth2/token.php';
    $username="testclient";
    $password="testpass";
    $token=$_GET['code'];
$process = curl_init($host);

curl_setopt($process, CURLOPT_HEADER, 0);
curl_setopt($process, CURLOPT_USERPWD, $username . ":" . $password);
curl_setopt($process, CURLOPT_TIMEOUT, 30);
curl_setopt($process, CURLOPT_POST, 1);
curl_setopt($process, CURLOPT_POSTFIELDS, 'grant_type=authorization_code&code='.$token);
curl_setopt($process, CURLOPT_RETURNTRANSFER, TRUE);
$return = curl_exec($process);
curl_close($process);

$json=json_decode($return);

$token= $json->access_token;
echo "access_tocken :".$token;
?>
<a href="test2.php?code=<?php echo $token;?>">Go Forward</a>
