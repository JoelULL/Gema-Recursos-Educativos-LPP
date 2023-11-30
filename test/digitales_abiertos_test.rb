require "test_helper"
class DigitalesAbiertosTest < Test::Unit::TestCase
  def test_class_empty
    assert_true(RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento],"foo://example.com:8042/over/there?name=ferret#nose","9-12-2012", nil).instance_of?(RecursosEducativos::DigitalesAbiertos))
  end
  
  def setup
    RecursosEducativos::Recurso.class_variable_set(:@@numero_de_recursos,0)
    @recurso_default = RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:8042/over/there?name=ferret#nose","9-12-2012",nil)
    @recurso_comparable = RecursosEducativos::DigitalesAbiertos.new(2,"marca","titulo","descripcion","nivel","tipo","categoria","material",70,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:9042/over/there?name=ferret#nose","1-1-2023",nil)
    @recurso_medio = RecursosEducativos::DigitalesAbiertos.new(3,"marca","titulo","descripcion","nivel","tipo","categoria","material",65,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:8042/over/there?name=ferret#nose","25-9-2021",nil)
    @lori1 = {RecursosEducativos::CALIDAD_CONTENIDO => 1,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 1}
    @recurso_lori = RecursosEducativos::DigitalesAbiertos.new(4,"marca","titulo","descripcion","nivel","tipo","categoria","material",65,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:8042/over/there?name=ferret#nose","25-9-2021",nil)
    @recurso_lori_getter = RecursosEducativos::DigitalesAbiertos.new(4,"marca","titulo","descripcion","nivel","tipo","categoria","material",65,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:8042/over/there?name=ferret#nose","25-9-2021",@lori1)

  end
  def test_getters_clase
      assert_equal(1,@recurso_default.id)
      assert_equal("marca",@recurso_default.marca)
      assert_equal("titulo",@recurso_default.titulo)
      assert_equal("descripcion",@recurso_default.descripcion)
      assert_equal("nivel",@recurso_default.nivel_experiencia)
      assert_equal("tipo",@recurso_default.tipo_actividad)
      assert_equal("categoria",@recurso_default.categoria)
      assert_equal("material",@recurso_default.material)
      assert_equal(60,@recurso_default.temporalizacion)
      assert_equal([:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],@recurso_default.concepto)
      assert_equal("foo://example.com:8042/over/there?name=ferret#nose",@recurso_default.uri)
      assert_equal("9-12-2012",@recurso_default.fecha_creacion)
      ##getter lori
      assert_equal({:accesibilidad=>1, :calidad_contenido=>1, :diseño_presentacion=>1, :motivacion=>1, :objetivos_aprendizaje=>1, :rehusabilidad=>1, :usabilidad=>1, :valor_educativo=>1},@recurso_lori_getter.lori)

  end
    def comprobacion_tipo_digitales_abiertos
      assert_kind_of(Integer,@recurso_default.id)
      assert_kind_of(String,@recurso_default.marca)
      assert_kind_of(String,@recurso_default.titulo)
      assert_kind_of(String,@recurso_default.descripcion)
      assert_kind_of(Symbol,@recurso_default.nivel_experiencia)
      assert_kind_of(String,@recurso_default.tipo_actividad)
      assert_kind_of(String,@recurso_default.categoria)
      assert_kind_of(String,@recurso_default.material)
      assert_kind_of(Integer,@recurso_default.temporalizacion)
      assert_kind_of(Array,@recurso_default.concepto)
      @recurso_default.concepto.each do |concepto|
        assert_kind_of(Symbol, concepto)
      end
      assert_kind_of(String,@recurso_default.uri)
      assert_kind_of(String,@recurso_default.fecha_creacion)
      ##comprobacion de tipo lori
      assert_kind_of(Hash,@recurso_lori_getter.lori)
  end

  def test_to_s
      assert_equal("Recurso: Identificacion: 1 - Marca: marca - Titulo: titulo - Descripcion: descripcion - Experiencia: nivel - Tipo: tipo - Categoria: categoria - Material: material - Temporalizacion: 60 - Conceptos: [\"razonamiento\", \"abstraccion\", \"descomposicion\", \"patrones\", \"algoritmos\", \"codificacion\", \"validacion\"], - URI: foo://example.com:8042/over/there?name=ferret#nose, -Fecha de creacion: 9-12-2012",@recurso_default.to_s)

  end
  def test_herencia_hija
    assert_equal([RecursosEducativos::DigitalesAbiertos, RecursosEducativos::Recurso, Enumerable, Comparable, Object, Kernel, BasicObject],RecursosEducativos::DigitalesAbiertos.herencia_de_clase)
    assert_instance_of(RecursosEducativos::DigitalesAbiertos,@recurso_default)
    assert_kind_of(Object,RecursosEducativos::DigitalesAbiertos)
    assert_kind_of(Class,RecursosEducativos::DigitalesAbiertos)
    assert_kind_of(Module,RecursosEducativos::DigitalesAbiertos)
    assert_kind_of(BasicObject,RecursosEducativos::DigitalesAbiertos)
    assert_true(RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento],"foo://example.com:8042/over/there?name=ferret#nose","9-12-2012",nil).is_a?(RecursosEducativos::Recurso))
  end

  def test_contar_instancia_hija
    assert_equal(5,RecursosEducativos::DigitalesAbiertos.count)
  end

  def test_comparador_digitales_abiertos
    assert_true(@recurso_default < @recurso_comparable)
    assert_false(@recurso_default > @recurso_comparable)
    assert_false(@recurso_default == @recurso_comparable)
    assert_true(@recurso_default != @recurso_comparable)
    assert_true(@recurso_default <= @recurso_comparable)
    assert_false(@recurso_default >= @recurso_comparable)
    assert_true(@recurso_default < @recurso_medio && @recurso_medio < @recurso_comparable)
  end
  def test_enumeracion_digitales_abiertos
    assert_equal(60,@recurso_default.max)
    assert_equal(1,@recurso_default.min)
    assert_equal([1,60],@recurso_default.sort)
    assert(@recurso_default.include?(1))
    assert_equal([1,60],@recurso_default.take(2))
    assert_equal([60],@recurso_default.drop(1))

    result_each = []
    @recurso_default.each { |element| result_each << element * 2 }
    assert_equal([2, 120], result_each)

    result_map = @recurso_default.map { |element| element.to_s }
    assert_equal(['1', '60'], result_map)
  end
    def test_enumeracion_digitales_abiertos_array
    @array_recursos = [@recurso_default, @recurso_medio, @recurso_comparable]
    assert_equal(70,@array_recursos.max.temporalizacion)
    assert_equal(60,@array_recursos.min.temporalizacion)
    sort_recursos = @array_recursos.sort_by(&:id)
    assert_equal([1,2,3],sort_recursos.map(&:id))
  end
  def test_aplicar_lori
    test_lori = RecursosEducativos::aplicar_lori_recurso_digital_abierto(@recurso_lori, @lori1)
    assert_equal({:accesibilidad=>1, :calidad_contenido=>1, :diseño_presentacion=>1, :motivacion=>1, :objetivos_aprendizaje=>1, :rehusabilidad=>1, :usabilidad=>1, :valor_educativo=>1},test_lori.lori)
  end
  def test_seleccion_recurso
    @lori2 = {RecursosEducativos::CALIDAD_CONTENIDO => 1,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 5}
    @lori3 = {RecursosEducativos::CALIDAD_CONTENIDO => 1,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 3}
    @lori4 = {RecursosEducativos::CALIDAD_CONTENIDO => 1,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 5}
    @lori5 = {RecursosEducativos::CALIDAD_CONTENIDO => 1,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 1, RecursosEducativos::MOTIVACION => 1, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 1,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 3}

    @recurso_lori1 = RecursosEducativos::DigitalesAbiertos.new(10,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:8042/over/there?name=ferret#nose","9-12-2012",@lori2)
    @recurso_lori2 = RecursosEducativos::DigitalesAbiertos.new(11,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:8042/over/there?name=ferret#nose","9-12-2012",@lori3)
    @recurso_lori3 = RecursosEducativos::DigitalesAbiertos.new(12,"marca","titulo","descripcion","nivel","tipo","categoria","material",45,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:8042/over/there?name=ferret#nose","10-12-2012",@lori4)
    @recurso_lori4 = RecursosEducativos::DigitalesAbiertos.new(13,"marca","titulo","descripcion","nivel","tipo","categoria","material",45,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:8042/over/there?name=ferret#nose","10-12-2012",@lori5)
  agrupacion = [@recurso_lori1, @recurso_lori2, @recurso_lori3, @recurso_lori4]
    #assert_equal(nil,RecursosEducativos::seleccion_recurso(agrupacion))
  result_agrup = RecursosEducativos::seleccion_recurso(agrupacion)
  ids_esperados = [10,12]
  ids_seleccionados = result_agrup.map { |recursos| recursos.id}
  assert_equal(ids_esperados,ids_seleccionados)
  end
end
