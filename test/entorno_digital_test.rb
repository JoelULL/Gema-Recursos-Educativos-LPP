require "test_helper"
class EntornoDigitalTest < Test::Unit::TestCase
  def test_class_empty
    @default = RecursosEducativos::EntornoDigital.new(1,"nombre",:taller,[])
    assert_instance_of(RecursosEducativos::EntornoDigital,@default)
  end
  def setup
     @recurso_1 = RecursosEducativos::Recurso.new(1,"marca","titulo1","descripcion",RecursosEducativos::BEGINNER,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
     @recurso_2 = RecursosEducativos::Recurso.new(2,"marca","titulo2","descripcion",RecursosEducativos::EXPERT,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
#INTERMEDIATE
    @recurso_3 = RecursosEducativos::Recurso.new(3,"marca","titulo3","descripcion",RecursosEducativos::INTERMEDIATE,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])

    @entorno_default = RecursosEducativos::EntornoDigital.new(1,"nombre",:taller,[@recurso_1,@recurso_2,@recurso_3])
  end

  def test_getters
   #assert_equal(1,@recurso_default.id)
    assert_equal(1,@entorno_default.id_code)
    assert_equal("nombre",@entorno_default.nombre)
    assert_equal(:taller,@entorno_default.categoria)
    assert_equal([@recurso_1,@recurso_2,@recurso_3],@entorno_default.coleccion) 
  end
  def test_to_s
    assert_equal("- Id :1 - nombre: nombre -categoria: taller -coleccion:titulo1, titulo2, titulo3",@entorno_default.to_s)
  end
end
