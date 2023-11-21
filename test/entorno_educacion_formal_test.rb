require "test_helper"
class EntornoEducacionFormalTest < Test::Unit::TestCase
  def test_clase_vacia
    assert_nothing_raised do
      RecursosEducativos::EntornoEducacionFormal.new(nil,nil,nil,nil,nil)
    end
  end
 # def test_herencia_entorno_digital
   # assert_instance_of(RecursosEducativos::Entor,@entorno_default)
   # assert_kind_of(Object,RecursosEducativos::EntornoDigital)
   # assert_kind_of(Class,RecursosEducativos::EntornoDigital)
   # assert_kind_of(Module,RecursosEducativos::EntornoDigital)
   # assert_kind_of(BasicObject,RecursosEducativos::EntornoDigital)
  #end
  #
end

