<?php

class Persona{

  private $apellidos;
  private $nombres;
  private $estadoCivil;
  private $numeroHijos;
  private $telefono;

  //METODOS magicos
  public function __GET($atributo){
    return $this->$atributo;
  }
  public function __SET($atributo, $valor){
    $this->$atributo = $valor;
  }


}

$persona1 = new Persona();

$persona1->__SET("apellidos", "SOTELO CARDENAS");
$persona1->__SET("nombres", "Ana Cecilia");
$persona1->__SET("telefono", "942064780");

echo $persona1->__GET("apellidos");
echo $persona1->__GET("nombres");
echo $persona1->__GET("telefono");