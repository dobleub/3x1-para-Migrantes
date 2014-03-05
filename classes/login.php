<?php
/*
 * login.php
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

include "connection.php";

class Login extends Connection{
	private $user;
	private $passwd;
	
	public function setUser($user){
		$this->user = $user;
	}
	public function setPasswd($passwd){
		$this->passwd = $passwd;
	}
	public function getUser(){
		return $this->user;
	}
	public function getPasswd(){
		return $this->passwd;
	}
	
	public function loging(){
		$pdo = parent::getConnection();
		
		$log = $pdo->prepare("select * from usuarios where curp = ? and passwd = ?");
		$log -> bindValue(1,$this->getUser());
		$log -> bindValue(2,$this->getPasswd());
		$log -> execute();
		
		if($log->rowCount() == 1):
			$info = $log -> fetch(PDO::FETCH_OBJ);
			$_SESSION['usuario'] = $info->curp;
			$_SESSION['login'] = true;
			return true;
		else:
			return false;
		endif;
	}
}
