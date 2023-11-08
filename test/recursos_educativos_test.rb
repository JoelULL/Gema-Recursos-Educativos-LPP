# frozen_string_literal: true

require "test_helper"

class RecursosEducativosTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::RecursosEducativos.const_defined?(:VERSION)
    end
  end

  test "prueba clase con atributos" do
    def test_class_exists
      assert_nothing_raised do
        RecursosEducativos::Recurso.new(1,"code.org","write your first computer","descripcion","begginer","plugged","smartphone",60,[:algoritmos, :codificacion])
      end
    end
  end
end
