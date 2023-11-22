require "test_helper"
class EntornoEducacionInformalTest < Test::Unit::TestCase
  def test_clase_vacia
    assert_nothing_raised do
      RecursosEducativos::EntornoEducacionInformal.new(nil,nil,nil,nil,nil)
    end
  end
    def setup
    @recurso_1 = RecursosEducativos::Recurso.new(1,"marca","titulo1","descripcion",RecursosEducativos::BEGINNER,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
    @recurso_2 = RecursosEducativos::Recurso.new(2,"marca","titulo2","descripcion",RecursosEducativos::EXPERT,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
#INTERMEDIATE
    @recurso_3 = RecursosEducativos::Recurso.new(3,"marca","titulo3","descripcion",RecursosEducativos::INTERMEDIATE,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
    @recurso_4 = RecursosEducativos::Recurso.new(4,"marca","titulo3","descripcion",RecursosEducativos::BEGINNER,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])

    @entorno_default = RecursosEducativos::EntornoEducacionInformal.new(1,"nombre",:taller,[@recurso_1,@recurso_2,@recurso_3],30.0)
    @entorno_nivel = RecursosEducativos::EntornoEducacionInformal.new(1,"nombre",:taller,[@recurso_2,@recurso_3],20.0)
    @entorno_nivel2 =RecursosEducativos::EntornoEducacionInformal.new(1,"nombre",:taller,[@recurso_1,@recurso_4],10.0)
  end

  def test_getters_clase_informal
    assert_equal(1,@entorno_default.id_code)
    assert_equal("nombre",@entorno_default.nombre)
    assert_equal(:taller,@entorno_default.categoria)
    assert_equal([@recurso_1,@recurso_2,@recurso_3],@entorno_default.coleccion)
    assert_equal(30.0,@entorno_default.precio)
  end
    def test_to_s_informal
      assert_equal("- Id :1 - nombre: nombre -categoria: taller -coleccion:titulo1, titulo2, titulo3,30.0",@entorno_default.to_s)
  end
    def comprobacion_tipos_atributos_formal
    assert_kind_of(Integer,@entorno_default.id_code)
    assert_kind_of(String,@entorno_default.nombre)
    assert_kind_of(Symbol,@entorno_default.categoria)
    assert_kind_of(Array,@entorno_default.coleccion)
    @recurso_default.each do |recurso|
      assert_kind_of(RecursosEducativos::Recurso, recurso)
    end
    assert_kind_of(Float,@entorno_default.precio)
  end
    def test_herencia_entorno_digital
    assert_instance_of(RecursosEducativos::EntornoEducacionInformal,@entorno_default)
    assert_true(@entorno_default.is_a?(RecursosEducativos::EntornoDigital))
    assert_kind_of(Object,RecursosEducativos::EntornoEducacionFormal)
    assert_kind_of(Class,RecursosEducativos::EntornoEducacionFormal)
    assert_kind_of(Module,RecursosEducativos::EntornoEducacionFormal)
    assert_kind_of(BasicObject,RecursosEducativos::EntornoEducacionFormal)
  end

   def test_duracion_estimada
    result = RecursosEducativos.obtener_duracion_coleccion(@entorno_default)
    assert_equal(180,result)
  end



end
