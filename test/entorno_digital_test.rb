require "test_helper"
class EntornoDigitalTest < Test::Unit::TestCase
  def test_class_empty
    @default = RecursosEducativos::EntornoDigital.new(1,"nombre",:taller,[])
    assert_instance_of(RecursosEducativos::EntornoDigital,@default)
  end
end
