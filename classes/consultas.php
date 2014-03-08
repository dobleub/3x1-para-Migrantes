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

include "autoload.php";
	
$Util = new Utilidades;

$sql = "call v_persona_telefonos('SALA981201HOC...',@echo)";
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

mysql_info();
mysql_error();

