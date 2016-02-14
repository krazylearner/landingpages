<?php
// Put this code at the top of landing page on which you want to record clicks from bad ip
if (!empty($_GET['crtag'])) {
	
  $ip = $_SERVER['REMOTE_ADDR'];
  $url = 'http://check.getipintel.net/check.php?ip='.$ip.'&contact=comptechsolutionsindia@gmail.com';
  $ipScore = file_get_contents($url);
  date_default_timezone_set('America/New_York');
  $est =  date("F j, Y, g:i a");
  date_default_timezone_set('Canada/Pacific');
  $pst = date("F j, Y, g:i a");  
  $array = array(
  						'clicks' => 1,
  						'ipscore'=> $ipScore,
  						'est'    => $est,
  						'pst'    => $pst,
  						'ip'     => $ip,
  						'lp'    =>  $_SERVER['SCRIPT_NAME']
  					);
  $filename = 'file_name.dat';					
  //at a later point, you can convert it back to array like
	$recoveredData = file_get_contents('file_name.dat');
	$recoveredArray = unserialize($recoveredData);
 	$recoveredArray[] =  $array;
  $serializedData = serialize($recoveredArray); //where '$array' is your array
	file_put_contents($filename, $serializedData);
}
?>