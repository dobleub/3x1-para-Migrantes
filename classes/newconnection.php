<?php
/*
 * connection.php
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

abstract class Connection{
	const user = "root";
	const passwd = "";
	
	private static $instance = null;
	
	private static function start_connection(){
		try{
			if(self::$instance == null):
				$dsn = "mysql:host=localhost;dbname=sedesis";
				self::$instance = new PDO($dsn,  self::user, self::passwd);
				self::$instance -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);	
			endif;
		} catch (PDOException $e){
			echo "Error= ".$e->getMessage();
		}
	
	return self::$instance;
	}
	
	protected static function getConnection(){
		return self::start_connection();
	}
}

