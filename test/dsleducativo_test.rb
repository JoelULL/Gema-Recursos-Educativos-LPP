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
    assert_nothing_raised do
     RecursosEducativos::DslEducativo.new(001,'vestibulo',:taller) do
     end
    end
  end
  def setup
    @d1 = RecursosEducativos::DigitalesAbiertos.new( 015, 'ull', "exploradores de secuencias", 'secuencias', RecursosEducativos::BEGINNER,:guiada, :desenchufada, 'papel', 30, [:algoritmos], 'riull',2023)
    @d2 = RecursosEducativos::DigitalesAbiertos.new( 003, 'ull', "kidsort", 'bucles', RecursosEducativos::BEGINNER,:guiada, :desenchufada, 'papel', 30, [:algoritmos], 'riull',2023)
  end
  def test_registrar
    dsl_default = RecursosEducativos::DslEducativo.new(001,'vestibulo',:taller)do
      registrar 015, 'ull', "exploradores de secuencias", 'secuencias', RecursosEducativos::BEGINNER,:guiada, :desenchufada, 'papel', 30, [:algoritmos], 'riull',2023
      registrar 003, 'ull', "kidsort", 'bucles', RecursosEducativos::BEGINNER,:guiada, :desenchufada, 'papel', 30, [:algoritmos], 'riull',2023
    end
    assert_equal([@d1,@d2], dsl_default.recursos) 
  end
end


