# frozen_string_literal: true

require "test_helper"

class RecursosEducativosTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::RecursosEducativos.const_defined?(:VERSION)
    end
  end

  test "prueba clase vacia" do
    def test_class_exists
      assert_nothing_raised do
        RecursosEducativos::Recurso.new
      end
    end
  end
end
