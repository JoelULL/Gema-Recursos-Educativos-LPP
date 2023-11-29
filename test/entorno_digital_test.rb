require "test_helper"
class EntornoDigitalTest < Test::Unit::TestCase
  def test_class_empty
    @default = RecursosEducativos::EntornoDigital.new(1,"nombre",:taller,[],nil)
    assert_instance_of(RecursosEducativos::EntornoDigital,@default)
  end
  def setup
     @recurso_1 = RecursosEducativos::Recurso.new(1,"marca","titulo1","descripcion",RecursosEducativos::BEGINNER,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
     @recurso_2 = RecursosEducativos::Recurso.new(2,"marca","titulo2","descripcion",RecursosEducativos::EXPERT,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
#INTERMEDIATE
    @recurso_3 = RecursosEducativos::Recurso.new(3,"marca","titulo3","descripcion",RecursosEducativos::INTERMEDIATE,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
    @recurso_4 = RecursosEducativos::Recurso.new(4,"marca","titulo4","descripcion",RecursosEducativos::BEGINNER,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])

    @entorno_default = RecursosEducativos::EntornoDigital.new(1,"nombre",:taller,[@recurso_1,@recurso_2,@recurso_3],nil)
    @entorno_nivel = RecursosEducativos::EntornoDigital.new(1,"nombre",:taller,[@recurso_2,@recurso_3],nil)
    @entorno_nivel2 =RecursosEducativos::EntornoDigital.new(1,"nombre",:taller,[@recurso_1,@recurso_4],nil)
  end

  def test_getters
    assert_equal(1,@entorno_default.id_code)
    assert_equal("nombre",@entorno_default.nombre)
    assert_equal(:taller,@entorno_default.categoria)
    assert_equal([@recurso_1,@recurso_2,@recurso_3],@entorno_default.coleccion) 
  end
  def comprobacion_tipos_atributos
    assert_kind_of(Integer,@entorno_default.id_code)
    assert_kind_of(String,@entorno_default.nombre)
    assert_kind_of(Symbol,@entorno_default.categoria)
    assert_kind_of(Array,@entorno_default.coleccion)
    @recurso_default.each do |recurso|
      assert_kind_of(RecursosEducativos::Recurso, recurso)
    end
  end
  def test_to_s
    assert_equal("- Id :1 - nombre: nombre -categoria: taller -coleccion:titulo1, titulo2, titulo3",@entorno_default.to_s)
  end
  def test_numero_de_recursos_coleccion
    assert_equal(3,@entorno_default.numero_de_recursos_coleccion)
  end
  def test_nivel_medio_experiencia
    assert_equal(:intermediate,@entorno_default.nivel_medio)
    assert_equal(:expert,@entorno_nivel.nivel_medio)
    assert_equal(:beginner,@entorno_nivel2.nivel_medio)
  end
  def test_herencia_entorno_digital
    assert_instance_of(RecursosEducativos::EntornoDigital,@entorno_default)
    assert_kind_of(Object,RecursosEducativos::EntornoDigital)
    assert_kind_of(Class,RecursosEducativos::EntornoDigital)
    assert_kind_of(Module,RecursosEducativos::EntornoDigital)
    assert_kind_of(BasicObject,RecursosEducativos::EntornoDigital)
  end
  def test_duracion_estimada
    result = RecursosEducativos.obtener_duracion_coleccion(@entorno_default)
    assert_equal(180,result)
  end
  #Metodo polimorfico. En funcion del tipo del objeto comportamiento diferente.
  def test_inlcusion_recursos
    @entorno_actualizado = RecursosEducativos.inclusion_recursos_coleccion(@entorno_default, [@recurso_4])       
    assert_instance_of(RecursosEducativos::EntornoDigital, @entorno_actualizado)
    assert_equal("- Id :1 - nombre: nombre -categoria: taller -coleccion:titulo1, titulo2, titulo3, titulo4", @entorno_actualizado.to_s)
  end
end
