<?php
/*
 * utilidades.php
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

//function __autoload($class){
	//include strtolower($class)."php";
//}

require_once("connection.php");

class Utilidades extends Connection{
	private $sql;
	
	public function setSql($sql){
		$this->sql = $sql;
	}
	public function getSql(){
		return $this->sql;
	}
	
	public function executesql(){
		$pdo = parent::getConnection();
		
		$log = $pdo->prepare($this->getSql());
		$log->execute();
		
		//$info = $log->fetch(PDO::FETCH_OBJ);
		$info = $log->fetchAll(PDO::FETCH_OBJ);
		if (count($info)) {
			foreach($info as $row){
				print_r($row);
				print("<br/>");
			}
		}
	}

}

