<?php

header('Content-Type: application/json');
$HOST='139.162.173.93';
    $USER		 ='beetnetc_panel';
    $PASS		 ='%oQhOx;?iyN{';
    $DB	  		 ='beetnetc_panel';
    $conn 	 	 = mysqli_connect($HOST, $USER, $PASS, $DB);

if (isset($_GET['request'])){
    $user_name   = trim($_GET['user']);
    $user_name   = strip_tags($user_name);
    $user_name   = htmlspecialchars($user_name);
    
    $user_pass   = trim($_GET['pass']);
    $user_pass   = strip_tags($user_pass);
    $user_pass   = htmlspecialchars($user_pass);
  
    $sql 		 = "SELECT * FROM vpns WHERE status='active' AND username='$user_name' AND password='$user_pass'";
    $result 	 = mysqli_query($conn, $sql);
    $num_row 	 = mysqli_num_rows($result);
    
    $sql2 	     = "SELECT * FROM servers";
    $result2 	 = mysqli_query($conn, $sql2);
    $num_row2  	 = mysqli_num_rows($result2);
    
    $row 		 = mysqli_fetch_assoc($result);

    $date 		 = date('Y-m-d h:m:s');
    $duration  	 = $row['duration'];
  
  if ($duration == .1) {
      $duration = 3;
  }else {
      $duration = $duration * 30;
  }
  
  $exp_date = date('Y-m-d h:m:s', strtotime('+'.$duration.'days'));
  
  if ($row['activated_at'] == ''){
      
	  
	  if ($num_row > 0){
		$update = "UPDATE vpns SET activated_at = '$date', expired_on = '$exp_date' WHERE username='$user_name' AND password='$user_pass'";
      mysqli_query($conn, $update);
	  
      
		$sql2 = "SELECT * FROM vpns WHERE status='active' AND username='$user_name' AND password='$user_pass'";
        $result2 = mysqli_query($conn, $sql2);
        $num_row2 = mysqli_num_rows($result2);
		$row4 	  = mysqli_fetch_assoc($result2);
        
        $sql      = "SELECT * FROM servers";
        $result   = mysqli_query($conn2, $sql);
        $expiration = $row4['expired_on'];
        $date       = date('M d Y', strtotime($expiration));
        
        echo '{
  "status":"authorized",
  "user":"'.$user_name.'",
  "expiry":"'.$date.'"
}';
	  }else {
	      echo '{
  "status":"unauthorized"
}';
  }
  } else if ($num_row > 0){
        
        $sql3 = "SELECT * FROM vpns WHERE status='active' AND username='$user_name' AND password='$user_pass'";
        $result3 = mysqli_query($conn, $sql3);
        $num_row3 = mysqli_num_rows($result3);
        
        $sql2      = "SELECT * FROM servers";
        $result   = mysqli_query($conn, $sql2);
        $expiration = $row['expired_on'];
        $date       = date('M d Y', strtotime($expiration));
        
        echo '{
  "status":"authorized",
  "user":"'.$user_name.'",
  "expiry":"'.$date.'"
}';
  } else {
	      echo '{
  "status":"unauthorized"
}';
  }

} else {
	$info = array("error"=>"unauthorized");
print_r(json_encode($info, JSON_PRETTY_PRINT));
}
?>


