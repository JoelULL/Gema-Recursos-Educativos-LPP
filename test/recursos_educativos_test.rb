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
     @recurso_default = RecursosEducativos::Recurso.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
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
  end
  def test_numero_recursos
    assert_not_equal(0,RecursosEducativos::Recurso.count)
  end

  
end
