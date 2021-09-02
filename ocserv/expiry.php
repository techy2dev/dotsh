<?php
$HOST='139.162.55.37';
$USER='beetnetc_panel';
$PASS='Premium2018!!!@';
$DB='beetnetc_panel';
$conn = mysqli_connect($HOST, $USER, $PASS, $DB);
$file = fopen('/etc/ocserv/server.txt', 'w') or die ('Unable to open file!');
$sql = "SELECT * FROM servers";
$result = mysqli_query($conn, $sql);
$num_row = mysqli_num_rows($result);   
      
      for ($j=0;$j<$num_row;$j++){//get each server ip
                $row = mysqli_fetch_assoc($result);
                $ip = $row['ip'];
				pass = $row['pass'];
		$text = $ip." ".$pass."\n";
    		fwrite($file, $text);
                
       }
?>