<?php 
$updown=$_GET['updown'];
	if ($updown=="up") {
		$comando="xdotool key XF86MonBrightnessUp && echo 'Up: executado com sucesso'";
	}else{
		$comando="xdotool key XF86MonBrightnessDown && echo 'Down: executado com sucesso'";
	}
	$return=shell_exec($comando);
	echo "<pre>".$return."</pre>";
?>