<?php
header('Content-Type: text/plain; charset=utf-8');

$dbServername = "103.237.38.218";
$dbUsername   = "rnvpncom_panel";
$dbPassword   = "%oQhOx;?iyN{";
$dbName       = "rnvpncom_panel";
$conn = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);

$username = $_POST['user'];
$username = mysqli_real_escape_string($conn, $username);

$online = array();        
$textFile = 'users.txt';

if (isset($_POST['disconnect'])){
    echo "Disconnected";
    mysqli_query($conn, "UPDATE vpns SET online = '0' WHERE username = '$username'");
}

else if (isset($_POST['connect'])){
    
    $password = $_POST['pass'];
    $password = mysqli_real_escape_string($conn, $password);

    $user           = "SELECT * FROM vpns WHERE username = '$username' AND password = '$password'";
    $userR          = mysqli_query($conn, $user);
    $user_num_rows  = mysqli_num_rows($userR);
    $user_row       = mysqli_fetch_assoc($userR);
    $duration       = $user_row['duration'];
    $expiry         = $user_row['expired_on'];
    $date           = date('Y-m-d h:m:d');
   
   if($expiry < $date){
		echo "invalid";
	} else if ($user_num_rows > 0){
        echo "valid";
        
		if ($expiry == ''){
                        
            if($duration == .1){
                $duration = 1;
            } else {
                $duration = $duration * 30;
            }
                        
            $exp = date('Y-m-d h:m:s', strtotime($date.' + '.$duration.' days'));
            mysqli_query($conn, "UPDATE vpns SET online = '1', activated_at = '$date', expired_on = '$exp' WHERE username = '$username' AND password = '$password'");
            
        } else {
            mysqli_query($conn, "UPDATE vpns SET online = '1' WHERE username = '$username' AND password = '$password'");
        }
        
    } else {
        echo "invalid";
    }
} else {
    echo "invalid";
} 

mysqli_close($conn);
?>


