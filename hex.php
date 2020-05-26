<?php

$palabra = $argv[1];
$hex="0x";
echo "Text : ".$palabra."\n";

for($i=0; $i<strlen($palabra); $i++){
	$hex=$hex.dechex( ord( $palabra[$i] ) );
	}
	
echo "Hex : ".$hex;
?>