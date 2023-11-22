require "test_helper"
class DigitalesAbiertosTest < Test::Unit::TestCase
  def test_class_empty
    assert_true(RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento],"foo://example.com:8042/over/there?name=ferret#nose","9-12-2012").instance_of?(RecursosEducativos::DigitalesAbiertos))
  end
  
  def setup
    RecursosEducativos::Recurso.class_variable_set(:@@numero_de_recursos,0)
    @recurso_default = RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:8042/over/there?name=ferret#nose","9-12-2012")
    @recurso_comparable = RecursosEducativos::DigitalesAbiertos.new(2,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:9042/over/there?name=ferret#nose","1-1-2023")
    @recurso_medio = RecursosEducativos::DigitalesAbiertos.new(3,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:8042/over/there?name=ferret#nose","25-9-2021")

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
  end

  def test_to_s
      assert_equal("Recurso: Identificacion: 1 - Marca: marca - Titulo: titulo - Descripcion: descripcion - Experiencia: nivel - Tipo: tipo - Categoria: categoria - Material: material - Temporalizacion: 60 - Conceptos: [\"razonamiento\", \"abstraccion\", \"descomposicion\", \"patrones\", \"algoritmos\", \"codificacion\", \"validacion\"], - URI: foo://example.com:8042/over/there?name=ferret#nose, -Fecha de creacion: 9-12-2012",@recurso_default.to_s)

  end
  def test_herencia_hija
    assert_equal([RecursosEducativos::DigitalesAbiertos, RecursosEducativos::Recurso, Comparable, Object, Kernel, BasicObject],RecursosEducativos::DigitalesAbiertos.herencia_de_clase)
    assert_instance_of(RecursosEducativos::DigitalesAbiertos,@recurso_default)
    assert_kind_of(Object,RecursosEducativos::DigitalesAbiertos)
    assert_kind_of(Class,RecursosEducativos::DigitalesAbiertos)
    assert_kind_of(Module,RecursosEducativos::DigitalesAbiertos)
    assert_kind_of(BasicObject,RecursosEducativos::DigitalesAbiertos)
    assert_true(RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento],"foo://example.com:8042/over/there?name=ferret#nose","9-12-2012").is_a?(RecursosEducativos::Recurso))
  end

  def test_contar_instancia_hija
    assert_equal(3,RecursosEducativos::DigitalesAbiertos.count)
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
end
