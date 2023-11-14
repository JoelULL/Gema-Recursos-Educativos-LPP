require "test_helper"
class DigitalesAbiertosTest < Test::Unit::TestCase
  def test_class_empty
    assert_true(RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento],"foo://example.com:8042/over/there?name=ferret#nose",2012).instance_of?(RecursosEducativos::DigitalesAbiertos))
  end
  def test_herencia
    assert_true(RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento],"foo://example.com:8042/over/there?name=ferret#nose",2012).is_a?(RecursosEducativos::Recurso))
    assert_true(RecursosEducativos::DigitalesAbiertos.is_a?(Module))
    assert_true(RecursosEducativos::DigitalesAbiertos.is_a?(Object))
    assert_true(RecursosEducativos::DigitalesAbiertos.is_a?(BasicObject))
  end
end
