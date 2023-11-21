require "test_helper"
class EntornoEducacionFormalTest < Test::Unit::TestCase
  def test_clase_vacia
    assert_nothing_raised do
      RecursosEducativos::EntornoEducacionFormal.new(nil,nil,nil,nil,nil)
    end
  end
  def setup
    @recurso_1 = RecursosEducativos::Recurso.new(1,"marca","titulo1","descripcion",RecursosEducativos::BEGINNER,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
    @recurso_2 = RecursosEducativos::Recurso.new(2,"marca","titulo2","descripcion",RecursosEducativos::EXPERT,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
#INTERMEDIATE
    @recurso_3 = RecursosEducativos::Recurso.new(3,"marca","titulo3","descripcion",RecursosEducativos::INTERMEDIATE,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
    @recurso_4 = RecursosEducativos::Recurso.new(4,"marca","titulo3","descripcion",RecursosEducativos::BEGINNER,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])

    @entorno_default = RecursosEducativos::EntornoEducacionFormal.new(1,"nombre",:taller,[@recurso_1,@recurso_2,@recurso_3],3)
    @entorno_nivel = RecursosEducativos::EntornoEducacionFormal.new(1,"nombre",:taller,[@recurso_2,@recurso_3],2)
    @entorno_nivel2 =RecursosEducativos::EntornoEducacionFormal.new(1,"nombre",:taller,[@recurso_1,@recurso_4],1)
  end

  def test_getters_clase_formal
    assert_equal(1,@entorno_default.id_code)
    assert_equal("nombre",@entorno_default.nombre)
    assert_equal(:taller,@entorno_default.categoria)
    assert_equal([@recurso_1,@recurso_2,@recurso_3],@entorno_default.coleccion)
    assert_equal(3,@entorno_default.numero_niveles)
  end
  def test_herencia_entorno_digital
    assert_instance_of(RecursosEducativos::EntornoEducacionFormal,@entorno_default)
    assert_true(@entorno_default.is_a?(RecursosEducativos::EntornoDigital))
    assert_kind_of(Object,RecursosEducativos::EntornoEducacionFormal)
    assert_kind_of(Class,RecursosEducativos::EntornoEducacionFormal)
    assert_kind_of(Module,RecursosEducativos::EntornoEducacionFormal)
    assert_kind_of(BasicObject,RecursosEducativos::EntornoEducacionFormal)
  end

  def test_to_s_formal
    assert_equal("- Id :1 - nombre: nombre -categoria: taller -coleccion:titulo1, titulo2, titulo3,3",@entorno_default.to_s)
  end

  
end

