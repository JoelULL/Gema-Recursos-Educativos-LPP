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
    @lori1 = {RecursosEducativos::CALIDAD_CONTENIDO => 1,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 1}
    @entorno_lori = RecursosEducativos::EntornoDigital.new(2,"nombre",:taller,[@recurso_1,@recurso_4],nil)
    @entorno_lori_getter = RecursosEducativos::EntornoDigital.new(17,"nombre",:taller,[@recurso_1,@recurso_4],@lori1)
  end

  def test_getters
    assert_equal(1,@entorno_default.id_code)
    assert_equal("nombre",@entorno_default.nombre)
    assert_equal(:taller,@entorno_default.categoria)
    assert_equal([@recurso_1,@recurso_2,@recurso_3],@entorno_default.coleccion)
    ##getter lori
    assert_equal({:accesibilidad=>1, :calidad_contenido=>1, :diseño_presentacion=>1, :motivacion=>1, :objetivos_aprendizaje=>1, :rehusabilidad=>1, :usabilidad=>1, :valor_educativo=>1},@entorno_lori_getter.lori)

  end
  def comprobacion_tipos_atributos
    assert_kind_of(Integer,@entorno_default.id_code)
    assert_kind_of(String,@entorno_default.nombre)
    assert_kind_of(Symbol,@entorno_default.categoria)
    assert_kind_of(Array,@entorno_default.coleccion)
    @recurso_default.each do |recurso|
      assert_kind_of(RecursosEducativos::Recurso, recurso)
    end
    assert_kind_of(Hash, @entorno_lori_getter.lori)
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
  def test_aplicar_lori_entorno_digital
    test_lori = RecursosEducativos::aplicar_lori_entorno_digital(@entorno_lori, @lori1)
    assert_equal({:accesibilidad=>1, :calidad_contenido=>1, :diseño_presentacion=>1, :motivacion=>1, :objetivos_aprendizaje=>1, :rehusabilidad=>1, :usabilidad=>1, :valor_educativo=>1}, test_lori.lori)
  end
  #RecursosEducativos::seleccion_entorno
  def test_seleccion_recurso
    @lori2 = {RecursosEducativos::CALIDAD_CONTENIDO => 5,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 1}

    @lori3 = {RecursosEducativos::CALIDAD_CONTENIDO => 3,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 1}

  
  nuevo1 = RecursosEducativos::aplicar_lori_entorno_digital(@entorno_default, @lori2) 
  nuevo2 = RecursosEducativos::aplicar_lori_entorno_digital(@entorno_default, @lori1)
  
   #assert_equal(true, RecursosEducativos::seleccion_entorno([nuevo1,nuevo2]))
   mismo_numero_rec = RecursosEducativos::seleccion_entorno([nuevo1,nuevo2])
   assert_equal(5, mismo_numero_rec.lori[RecursosEducativos::CALIDAD_CONTENIDO])

  nuevo3 = RecursosEducativos::aplicar_lori_entorno_digital(@entorno_default, @lori1)
  nuevo4 = RecursosEducativos::aplicar_lori_entorno_digital(@entorno_nivel, @lori2)
  dif_num_rec = RecursosEducativos::seleccion_entorno([nuevo1,nuevo2])
  assert_equal(1, dif_num_rec.id_code)
  end
end
