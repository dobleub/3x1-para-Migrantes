<?php
/*
 * consultas.php
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

include "../autoload.php";
include "../lib/password.php";

function generaPass(){
	$cadena = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
	$longitudCadena=strlen($cadena);

	$pass = "";
	$longitudPass=10;

	for($i=1 ; $i<=$longitudPass ; $i++){
		$pos=rand(0,$longitudCadena-1);
		$pass .= substr($cadena,$pos,1);
	}
	return $pass;
}
$password = generaPass();
echo $password;
echo "<br/>";
$hash = password_hash($password, PASSWORD_BCRYPT, ['cost' => 10]);
echo $hash;
echo "<br/>";
$match = password_verify($password, $hash);
echo $match;
echo "<br/>";

$Util = new Utilidades;

$sql = "call v_niveles_idiomas('av')";
$Util->setSql($sql);
$info = $Util->executesql();



##################################################################################

//echo "<table border='2'>
	//<tr>
		//<td>id</td>
		//<td>clave</td>
		//<td>nombre</td>
		//<td>abrev</td>
	//</tr>";
//foreach($info as $row){					// este si funciona pero no es dinamico
	////$result = var_dump($row);
	//$result = (array) $row;
		//echo "<tr>
				//<td>".$result['id']."</td>
				//<td>".$result['clave']."</td>
				//<td>".$result['nombre']."</td>
				//<td>".$result['abrev']."</td>
			//</tr>";
//}
//echo "</table>";

##################################################################################

if (count($info)):
	echo "<table border='1'>";
	foreach($info as $row){
		$result = (array) $row;
		echo "<tr>";
		foreach($result as $key => $value){
			//echo $item[$key] = $value;
			echo "<td>".$key."</td>";
		}
		echo "</tr>";
		
		echo "<tr>";
		foreach($result as $key => $value){
			//echo $item[$key] = $value;
			echo "<td>".$item[$key] = $value."</td>";
		}
		echo "</tr>";
	}
	echo "</table>";
endif;

mysql_info();
mysql_error();

