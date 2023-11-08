# frozen_string_literal: true

require "test_helper"
require "/home/usuario/LPPP/recursos_educativos/lib/recursos_educativos/recurso.rb"
class RecursosEducativosTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::RecursosEducativos.const_defined?(:VERSION)
    end
  end
  test "prueba de clase" do
    #    def initialize(id, marca, titulo, descripcion, nivel_experiencia,tipo_actividad, categoria, material, temporalizacion, concepto)
    def test_class_exist
      assert_nothing_raised do
        RecursosEducativos::Recurso.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento])
      end
    end
  end
  def setup
     @recurso_default = RecursosEducativos::Recurso.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion])
  end

  test "test de getters" do
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

end
