<?php

 // include our OAuth2 Server object
require_once 'server.php';

// Handle a request for an OAuth2.0 Access Token and send the response to the client
if (!$server->verifyResourceRequest(OAuth2\Request::createFromGlobals())) {
  echo '11'.  $server->getResponse()->send();
    die;
}
echo json_encode(array('success' => true, 'message' => 'You accessed my APIs!'));

$token = $server->getAccessTokenData(OAuth2\Request::createFromGlobals());
echo "User ID associated with this token is {$token['user_id']}";

//curl http://localhost/my-oauth2/resource.php -d 'access_token=48ef2fb3c7469f5e4b9fff005cc098cdd0105165'