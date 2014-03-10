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

include "../autoload.php";

if(isset($_GET['logout'])):
	if($_GET['logout']=='ok'):
		Login::logout();		//poner la funcion como static no es necesario instanciar un nuevo objeto
	endif;
endif;

if(isset($_SESSION['login'])):
?>
	Bienvenido <?php echo $_SESSION['usuario']; ?>
	<br/>
	<a href="usuario.php?logout=ok">Salir del Sistema</a>
<?php
else:
	echo "No tiene permiso para entrar a esta pagina";
endif;
