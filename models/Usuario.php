<?php

require_once 'Conexion.php';

class Usuario extends Conexion{

  private $accesoBD;  //Conexion

  public function __CONSTRUCT(){
    $this->accesoBD = parent::getConexion();
  }

  public function iniciarSesion($nombreUsuario = ""){
    try {
      $consulta = $this->accesoBD->prepare("CALL spu_usuarios_login(?)");
      $consulta->execute(array($nombreUsuario));
      return $consulta->fetch(PDO::FETCH_ASSOC);

    } catch(Exception $e) {
      die($e->getMesagge());
    }
  }

  public function registrarUsuario(){
    try {
      
        //1. Preparamos consulta
        $consulta = $this->accesoBD->prepare("CALL spu_usuarios_registrar(?,?,?,?)");
        //2. Ejecutamos consulta
        $consulta->execute(
         array(
           $datos["nombreusuario"],
           $datos["claveacceso"],
           $datos["apellidos"],
           $datos["nombres"]
           
         )
       );
     
      
    } catch(Exception $e) {
      die($e->getMesagge());
    }
   }

  public function eliminarUsuario(){
    try {
      $consulta = $this->accesoBD->prepare("CALL spu_usuarios_eliminar(?)");
      $consulta->execute(array($idcurso));
    } catch(Exception $e) {
      die($e->getMesagge());
    }
  }

  public function listarUsuarios(){
    try {
      // 1. Preparamos la consulya
      $consulta = $this->accesoBD->prepare("CALL spu_usuarios_listar()");
      //2. Ejecutamos la consulta
      $consulta->execute();
      //3. Devolvemos el resultado (array asociativo)
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    } catch(Exception $e) {
      die($e->getMesagge());
    }
  }
 }