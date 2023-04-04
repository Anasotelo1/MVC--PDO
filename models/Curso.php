<?php

require_once "Conexion.php";

//MODELO = CONTIENE LA LOGICA
// extends : HERENCIA (POO) en PHP
class Curso extends Conexion{

  //Objeto que almacena la conexion que viene desde el padre(Conexion)
  // y la compartira con los metodos (CRUD+)
  private $accesoBD;

  //Constructor, INICIALIZAR            
  // Valor de retorno de la funccion sera asignada a accesoBD 
  public function __CONSTRUCT(){
    $this->accesoBD = parent::getConexion(); 
  }

  //Metodo listar cursos
  public function listarCursos(){
    try{
      // 1. Preparamos la consulya
      $consulta = $this->accesoBD->prepare("CALL spu_cursos_listar()");
      //2. Ejecutamos la consulta
      $consulta->execute();
      //3. Devolvemos el resultado (array asociativo)
      return $consulta->fetchAll(PDO::FETCH_ASSOC);
    }
    catch(Excepction $e){
      die($e->getMessage());
    }

  }

  public function registrarCurso($datos = []){
    try{
       //1. Preparamos consulta
       $consulta = $this->accesoBD->prepare("CALL spu_cursos_registrar(?,?,?,?,?)");
       //2. Ejecutamos consulta
       $consulta->execute(
        array(
          $datos["nombrecurso"],
          $datos["especialidad"],
          $datos["complejidad"],
          $datos["fechainicio"],
          $datos["precio"]
          
        )
      );
    }
    catch(Excepction $e){
      die($e->getMessage());
    }
  }

  public function eliminarCurso($idcurso = 0){
    try{

    }
    catch(Excepction $e){
      die($e->getMessage());
    }
  }

  public function actualizarCurso(){
    try{

    }
    catch(Excepction $e){
      die($e->getMessage());
    }
  }


}

?>