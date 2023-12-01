require "test_helper"
class EntornoEducacionFormalTest < Test::Unit::TestCase
  def test_clase_vacia
    assert_nothing_raised do
      RecursosEducativos::EntornoEducacionFormal.new(nil,nil,nil,nil,nil,nil)
    end
  end
  def setup
    @recurso_1 = RecursosEducativos::Recurso.new(1,"marca","titulo1","descripcion",RecursosEducativos::BEGINNER,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
    @recurso_2 = RecursosEducativos::Recurso.new(2,"marca","titulo2","descripcion",RecursosEducativos::EXPERT,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
#INTERMEDIATE
    @recurso_3 = RecursosEducativos::Recurso.new(3,"marca","titulo3","descripcion",RecursosEducativos::INTERMEDIATE,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
    @recurso_4 = RecursosEducativos::Recurso.new(4,"marca","titulo4","descripcion",RecursosEducativos::BEGINNER,"tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])

    @entorno_default = RecursosEducativos::EntornoEducacionFormal.new(1,"nombre",:taller,[@recurso_1,@recurso_2,@recurso_3],3,nil)
    @entorno_nivel = RecursosEducativos::EntornoEducacionFormal.new(20,"nombre",:taller,[@recurso_2,@recurso_3],2,nil)
    @entorno_nivel2 =RecursosEducativos::EntornoEducacionFormal.new(1,"nombre",:taller,[@recurso_1,@recurso_4],1,nil)
    @lori1 = {RecursosEducativos::CALIDAD_CONTENIDO => 1,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 1}
    @entorno_lori_getter = RecursosEducativos::EntornoEducacionFormal.new(17,"nombre",:taller,[@recurso_1,@recurso_2,@recurso_3],3,@lori1)
    @entorno_lori = RecursosEducativos::EntornoEducacionFormal.new(17,"nombre",:taller,[@recurso_1,@recurso_2,@recurso_3],3,nil)

  end

  def test_getters_clase_formal
    assert_equal(1,@entorno_default.id_code)
    assert_equal("nombre",@entorno_default.nombre)
    assert_equal(:taller,@entorno_default.categoria)
    assert_equal([@recurso_1,@recurso_2,@recurso_3],@entorno_default.coleccion)
    assert_equal(3,@entorno_default.numero_niveles)
    ##getter lori
    assert_equal({:accesibilidad=>1, :calidad_contenido=>1, :diseño_presentacion=>1, :motivacion=>1, :objetivos_aprendizaje=>1, :rehusabilidad=>1, :usabilidad=>1, :valor_educativo=>1},@entorno_lori_getter.lori)
  end
  def test_herencia_entorno_digital
    assert_instance_of(RecursosEducativos::EntornoEducacionFormal,@entorno_default)
    assert_true(@entorno_default.is_a?(RecursosEducativos::EntornoDigital))
    assert_kind_of(Object,RecursosEducativos::EntornoEducacionFormal)
    assert_kind_of(Class,RecursosEducativos::EntornoEducacionFormal)
    assert_kind_of(Module,RecursosEducativos::EntornoEducacionFormal)
    assert_kind_of(BasicObject,RecursosEducativos::EntornoEducacionFormal)
  end

  #metodo polimorfico
  def test_to_s_formal
    assert_equal("- Id :1 - nombre: nombre -categoria: taller -coleccion:titulo1, titulo2, titulo3,3",@entorno_default.to_s)
  end

  def comprobacion_tipos_atributos_formal
    assert_kind_of(Integer,@entorno_default.id_code)
    assert_kind_of(String,@entorno_default.nombre)
    assert_kind_of(Symbol,@entorno_default.categoria)
    assert_kind_of(Array,@entorno_default.coleccion)
    @recurso_default.each do |recurso|
      assert_kind_of(RecursosEducativos::Recurso, recurso)
    end
    assert_kind_of(Integer,@entorno_default.numero_niveles)
    assert_kind_of(Hash, @entorno_lori_getter.lori)
  end
  def test_duracion_estimada
    result = RecursosEducativos.obtener_duracion_coleccion(@entorno_default)
    assert_equal(180,result)
  end
  #metodo polimorfico
  def test_inlcusion_recursos_formal
        @entorno_actualizado = RecursosEducativos.inclusion_recursos_coleccion(@entorno_default, [@recurso_4])
    assert_instance_of(RecursosEducativos::EntornoEducacionFormal, @entorno_actualizado)
    assert_equal("- Id :1 - nombre: nombre -categoria: taller -coleccion:titulo1, titulo2, titulo3, titulo4,3",@entorno_actualizado.to_s)
  end
  def test_aplicar_lori_entorno_formal
    test_lori = RecursosEducativos::aplicar_lori_entorno_digital(@entorno_lori, @lori1)
    assert_equal({:accesibilidad=>1, :calidad_contenido=>1, :diseño_presentacion=>1, :motivacion=>1, :objetivos_aprendizaje=>1, :rehusabilidad=>1, :usabilidad=>1, :valor_educativo=>1}, test_lori.lori)
  end
  #RecursosEducativos::seleccion_entorno
  def test_seleccion_entorno_formal
    #lori con calidad de contenido superior
    @lori2 = {RecursosEducativos::CALIDAD_CONTENIDO => 5,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 1}
    #lori con calidad de contenido inferior
    @lori3 = {RecursosEducativos::CALIDAD_CONTENIDO => 3,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 1}

   #entorno con mayor calidad
   nuevo1 = RecursosEducativos::aplicar_lori_entorno_digital(@entorno_default, @lori2)
   #entorno con menor calidad
   nuevo2 = RecursosEducativos::aplicar_lori_entorno_digital(@entorno_default, @lori1)

   mismo_numero_rec = RecursosEducativos::seleccion_entorno([nuevo1,nuevo2])
   assert_equal(5, mismo_numero_rec.lori[RecursosEducativos::CALIDAD_CONTENIDO])

   #entorno con mayor numero de recursos, menor calidad
   nuevo3 = RecursosEducativos::aplicar_lori_entorno_digital(@entorno_default, @lori1)
   #entorno con menor numero de recursos, mayor calidad
   nuevo4 = RecursosEducativos::aplicar_lori_entorno_digital(@entorno_nivel, @lori2)

   dif_num_rec = RecursosEducativos::seleccion_entorno([nuevo3,nuevo4])
   assert_equal(1, dif_num_rec.id_code)
  end
end

