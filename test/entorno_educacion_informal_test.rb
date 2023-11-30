require "test_helper"
class EntornoEducacionInformalTest < Test::Unit::TestCase
  def test_clase_vacia
    assert_nothing_raised do
      RecursosEducativos::EntornoEducacionInformal.new(nil,nil,nil,nil,nil,nil)
    end
  end
    def setup
    @recurso_1 = RecursosEducativos::Recurso.new(1,"marca","titulo1","descripcion",RecursosEducativos::BEGINNER,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
    @recurso_2 = RecursosEducativos::Recurso.new(2,"marca","titulo2","descripcion",RecursosEducativos::EXPERT,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
#INTERMEDIATE
    @recurso_3 = RecursosEducativos::Recurso.new(3,"marca","titulo3","descripcion",RecursosEducativos::INTERMEDIATE,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
    @recurso_4 = RecursosEducativos::Recurso.new(4,"marca","titulo4","descripcion",RecursosEducativos::BEGINNER,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])

    @entorno_default = RecursosEducativos::EntornoEducacionInformal.new(1,"nombre",:taller,[@recurso_1,@recurso_2,@recurso_3],30.0,nil)
    @entorno_nivel = RecursosEducativos::EntornoEducacionInformal.new(1,"nombre",:taller,[@recurso_2,@recurso_3],20.0,nil)
    @entorno_nivel2 =RecursosEducativos::EntornoEducacionInformal.new(1,"nombre",:taller,[@recurso_1,@recurso_4],10.0,nil)
    @lori1 = {RecursosEducativos::CALIDAD_CONTENIDO => 1,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 1}
    @entorno_lori_getter = RecursosEducativos::EntornoEducacionInformal.new(17,"nombre",:taller,[@recurso_1,@recurso_2,@recurso_3],30.0,@lori1)
  end

  def test_getters_clase_informal
    assert_equal(1,@entorno_default.id_code)
    assert_equal("nombre",@entorno_default.nombre)
    assert_equal(:taller,@entorno_default.categoria)
    assert_equal([@recurso_1,@recurso_2,@recurso_3],@entorno_default.coleccion)
    assert_equal(30.0,@entorno_default.precio)
    assert_equal({:accesibilidad=>1, :calidad_contenido=>1, :diseño_presentacion=>1, :motivacion=>1, :objetivos_aprendizaje=>1, :rehusabilidad=>1, :usabilidad=>1, :valor_educativo=>1},@entorno_lori_getter.lori)
  end
    #metodo polimorfico
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
    assert_kind_of(Hash, @entorno_lori_getter.lori)
  end
    def test_herencia_entorno_digital
    assert_instance_of(RecursosEducativos::EntornoEducacionInformal,@entorno_default)
    assert_true(@entorno_default.is_a?(RecursosEducativos::EntornoDigital))
    assert_kind_of(Object,RecursosEducativos::EntornoEducacionInformal)
    assert_kind_of(Class,RecursosEducativos::EntornoEducacionInformal)
    assert_kind_of(Module,RecursosEducativos::EntornoEducacionInformal)
    assert_kind_of(BasicObject,RecursosEducativos::EntornoEducacionInformal)
  end

   def test_duracion_estimada
    result = RecursosEducativos.obtener_duracion_coleccion(@entorno_default)
    assert_equal(180,result)
  end

   # metodo polimorfico
  def test_inlcusion_recursos
    @entorno_actualizado = RecursosEducativos.inclusion_recursos_coleccion(@entorno_default, [@recurso_4])
   assert_instance_of(RecursosEducativos::EntornoEducacionInformal, @entorno_actualizado)
    assert_equal("- Id :1 - nombre: nombre -categoria: taller -coleccion:titulo1, titulo2, titulo3, titulo4,30.0",@entorno_actualizado.to_s)
  end


end
