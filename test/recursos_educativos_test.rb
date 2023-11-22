# frozen_string_literal: true

require "test_helper"
#require "/home/usuario/LPPP/recursos_educativos/lib/recursos_educativos/recurso.rb"
class RecursosEducativosTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::RecursosEducativos.const_defined?(:VERSION)
    end
  end
  
  def test_class_exist
    assert_nothing_raised do
      RecursosEducativos::Recurso.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento])
    end
  end
  def setup
    RecursosEducativos::Recurso.class_variable_set(:@@numero_de_recursos,0)
     @recurso_default = RecursosEducativos::Recurso.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
     @recurso_comparable = RecursosEducativos::Recurso.new(2,"marca","titulo","descripcion","nivel","tipo","categoria","material",70,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
    @recurso_medio = RecursosEducativos::Recurso.new(3,"marca","titulo","descripcion","nivel","tipo","categoria","material",65,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
  end

  def test_getters
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
  end

  def comprobacion_tipo
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

  end

  def test_to_s
      assert_equal("Recurso: Identificacion: 1 - Marca: marca - Titulo: titulo - Descripcion: descripcion - Experiencia: nivel - Tipo: tipo - Categoria: categoria - Material: material - Temporalizacion: 60 - Conceptos: [\"razonamiento\", \"abstraccion\", \"descomposicion\", \"patrones\", \"algoritmos\", \"codificacion\", \"validacion\"]",@recurso_default.to_s)

  end

  def test_obtener_temporalizacion
    assert_equal(60,RecursosEducativos.obtener_temporalizacion(@recurso_default))
  end

  test "prueba_constantes" do 
     assert_equal(:beginner, RecursosEducativos::BEGINNER)
     assert_equal(:intermediate, RecursosEducativos::INTERMEDIATE)
     assert_equal(:expert, RecursosEducativos::EXPERT)
  end

  def test_herencia
    assert_equal([RecursosEducativos::Recurso, Comparable, Object, Kernel, BasicObject],RecursosEducativos::Recurso.herencia_de_clase)
    assert_instance_of(RecursosEducativos::Recurso,@recurso_default)
    assert_kind_of(Object,RecursosEducativos::Recurso)
    assert_kind_of(Class,RecursosEducativos::Recurso)
    assert_kind_of(Module,RecursosEducativos::Recurso)
    assert_kind_of(BasicObject,RecursosEducativos::Recurso)
  end
  def test_numero_recursos
    assert_equal(3,RecursosEducativos::Recurso.count)
  end
  
  def test_comparador_recurso
    assert_true(@recurso_default < @recurso_comparable)
    assert_false(@recurso_default > @recurso_comparable)
    assert_false(@recurso_default == @recurso_comparable)
    assert_true(@recurso_default != @recurso_comparable)
    assert_true(@recurso_default <= @recurso_comparable)
    assert_false(@recurso_default >= @recurso_comparable)
    assert_true(@recurso_default < @recurso_medio && @recurso_medio < @recurso_comparable)
  end  
end
