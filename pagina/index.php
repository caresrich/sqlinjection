<?php 
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$cn=mysqli_connect("127.0.0.1", "bett0", "123", "sqli");

?>
<html>
<head>
<title>Bett0 - SQL Ijection - Principal</title>
</head>
<style type="text/css">
body{
	font:76% Verdana,Tahoma,Arial,sans-serif;
	color:#4088b8;
	font-size: 15px;
	font-color="#FFFFFF";
}
a{
	text-decoration:none;
	color:#408888;
	
}
</style>

<body bgcolor="#C4CEC6">
 <center>
 <table border=0 width="80%">
 
	<tr><th><img src="banner.jpg" width="100%"></img></t></tr>
	
	<tr>
	  <td>
		<table border=0>

		<?php
		$sql = "select * from noticias";
		$exe = mysqli_query($cn, $sql)or die("No hay exe");
		while( $f = mysqli_fetch_array($exe, MYSQLI_NUM))
		{
			echo "<tr><td>";
			echo "<h3>Titulo: ".$f[1]."</h3>";
			echo $f[2]."<br/>";
			echo "<a href='detalle.php?id=".$f[0]."'><strong><i>Leer Mas...</i></strong></a><br/><br/>";
			echo "</td></tr>";
		}
		?>
		</table>
	  </td>	
	</tr>
	
 </table>
 </center>
</body>
</html>

