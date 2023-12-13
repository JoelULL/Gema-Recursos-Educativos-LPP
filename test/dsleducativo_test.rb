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
    @d1 = RecursosEducativos::DigitalesAbiertos.new( 015, 'ull', "exploradores de secuencias", 'Secuencias', RecursosEducativos::BEGINNER,:guiada, :desenchufada, 'papel', 30, [:algoritmos], 'riull',2023)
    @d2 = RecursosEducativos::DigitalesAbiertos.new( 003, 'ull', "kidsort", 'Bucles', RecursosEducativos::BEGINNER,:guiada, :desenchufada, 'papel', 30, [:algoritmos], 'riull',2023)
    @lori1 = {RecursosEducativos::CALIDAD_CONTENIDO => 5,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 5, RecursosEducativos::MOTIVACION => 3, RecursosEducativos::DISEÑO_PRESENTACION => 1, RecursosEducativos::USABILIDAD => 3,RecursosEducativos::ACCESIBILIDAD => 5,RecursosEducativos::REHUSABILIDAD => 2,RecursosEducativos::VALOR_EDUCATIVO => 3}
    @lori2 = {RecursosEducativos::CALIDAD_CONTENIDO => 1,RecursosEducativos::OBJETIVOS_APRENDIZAJE => 2, RecursosEducativos::MOTIVACION => 3, RecursosEducativos::DISEÑO_PRESENTACION => 4, RecursosEducativos::USABILIDAD => 5,RecursosEducativos::ACCESIBILIDAD => 1,RecursosEducativos::REHUSABILIDAD => 1,RecursosEducativos::VALOR_EDUCATIVO => 1}
  end
  def test_registrar
    dsl_default = RecursosEducativos::DslEducativo.new(001,'vestibulo',:taller)do
      registrar 015, 'ull', "exploradores de secuencias", 'secuencias', RecursosEducativos::BEGINNER,:guiada, :desenchufada, 'papel', 30, [:algoritmos], 'riull',2023
      registrar 003, 'ull', "kidsort", 'bucles', RecursosEducativos::BEGINNER,:guiada, :desenchufada, 'papel', 30, [:algoritmos], 'riull',2023
    end
    assert_equal([@d1,@d2], dsl_default.recursos) 
  end
  def test_evaluar
    dsl_default = RecursosEducativos::DslEducativo.new(001,'vestibulo',:taller)do
      evaluar 5, 5, 3, 1, 3, 5, 2 ,3
      evaluar 1, 2, 3, 4, 5, 1, 1, 1
    end
    assert_equal([@lori1,@lori2],dsl_default.evaluaciones)
  end

  def test_concepto
    dsl_default = RecursosEducativos::DslEducativo.new(001,'vestibulo',:taller)do
      concepto 'Secuencias'
      concepto 'Bucles'
    end
    assert_equal(['Secuencias', 'Bucles'],dsl_default.itinerarios)
  end
end


