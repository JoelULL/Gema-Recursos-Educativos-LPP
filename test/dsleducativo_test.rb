# frozen_string_literal: true

require "test_helper"
#require "/home/usuario/LPPP/recursos_educativos/lib/recursos_educativos/recurso.rb"
class DslEducativoTest < Test::Unit::TestCase
  test "VERSION" do
    assert do
      ::RecursosEducativos.const_defined?(:VERSION)
    end
  end
  
  def test_class_exist
    assert_nothing_raised {RecursosEducativos::DslEducativo.new}
  end
end
