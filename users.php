<?php
header('Content-Type: text/plain; charset=utf-8');

$dbServername = "172.105.17.28";
$dbUsername   = "civitliv_e";
$dbPassword   = "rootSahadatRoot";
$dbName       = "civitliv_e";
$conn = mysqli_connect($dbServername, $dbUsername, $dbPassword, $dbName);

$username = $_POST['user'];
$username = mysqli_real_escape_string($conn, $username);

$online = array();        
$textFile = 'users.txt';

if (isset($_POST['disconnect'])){
    echo "Disconnected";
    mysqli_query($conn, "UPDATE user_logins SET online = '0' WHERE user_name = '$username'");
}

else if (isset($_POST['connect'])){
    
    $password = $_POST['pass'];
    $password = mysqli_real_escape_string($conn, $password);

    $user           = "SELECT * FROM user_logins WHERE user_name = '$username'";
    $userR          = mysqli_query($conn, $user);
    $user_num_rows  = mysqli_num_rows($userR);
    $user_row       = mysqli_fetch_assoc($userR);
    $duration       = $user_row['expire_after'];
    $expiry         = $user_row['expiry_date'];
    $date           = date('Y-m-d');
    
	if ($expiry < $date AND $expiry != NULL) {
		echo "invalid";
	} else if ($user_num_rows > 0){
        echo "valid";
        
        if ($expiry == NULL){
                        
            if($duration == .1){
                $duration = 1;
            } else {
                $duration = $duration * 30;
            }
                        
            $exp = date('Y-m-d', strtotime($date.' + '.$duration.' days'));
            mysqli_query($conn, "UPDATE user_logins SET online = '1', expiry_date = '$exp', login_date = '$date' WHERE user_name = '$username'");
            
	} else {
            mysqli_query($conn, "UPDATE user_logins SET online = '1' WHERE user_name = '$username'");
        }
        
    } else {
        echo "invalid";
    }
} else {
    echo "invalid";
} 

mysqli_close($conn);
?>
