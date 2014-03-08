<?php
/*
 * index.php
 * 
 * Copyright 2014 dobleub <dobleub@MARY-LAPTOP>
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 * 
 */
session_start();

include "autoload.php";

if(isset($_POST['entrar'])):
	$user = filter_input(INPUT_POST,"usuario",FILTER_SANITIZE_MAGIC_QUOTES);
	$pass = filter_input(INPUT_POST,"password",FILTER_SANITIZE_MAGIC_QUOTES);
	
	$Obj = new Login;
	$Obj->setUser($user);
	$Obj->setPasswd($pass);
	
	if($Obj->loging()):
		header("Location: usuario.php");
	else:
		$error = "Error";
	endif;
endif;

?>
<!DOCTYPE>
<html xml:lang="en" lang="en">

<head>
	<title>::inicio::</title>
	<meta http-equiv="content-type" content="text/html;charset=utf-8" />
	<meta name="generator" content="Geany 1.23.1" />
</head>

<body>
	<form action="" method="POST" id="login_form">
		<label for="usuario">Usuario: SALA981201HOC...</label>
		<input name="usuario" type="text"/>
		<br/>
		<label for="password">Contraseña: qwerty</label>
		<input name="password" type="text"/>
		<br/>
		<input name="entrar" type="submit" value="Entrar"/>
	</form>
	<?php echo isset($error) ? $error : ''; ?>
</body>

</html>
