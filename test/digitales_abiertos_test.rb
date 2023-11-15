require "test_helper"
class DigitalesAbiertosTest < Test::Unit::TestCase
  def test_class_empty
    assert_true(RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento],"foo://example.com:8042/over/there?name=ferret#nose","9-12-2012").instance_of?(RecursosEducativos::DigitalesAbiertos))
  end
  def test_herencia
    assert_true(RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento],"foo://example.com:8042/over/there?name=ferret#nose","9-12-2012").is_a?(RecursosEducativos::Recurso))
    assert_true(RecursosEducativos::DigitalesAbiertos.is_a?(Module))
    assert_true(RecursosEducativos::DigitalesAbiertos.is_a?(Object))
    assert_true(RecursosEducativos::DigitalesAbiertos.is_a?(BasicObject))
  end
  def setup
    @recurso_default = RecursosEducativos::DigitalesAbiertos.new(1,"marca","titulo","descripcion","nivel","tipo","categoria","material",60,[:razonamiento, :abstraccion, :descomposicion, :patrones, :algoritmos, :codificacion,:validacion],"foo://example.com:8042/over/there?name=ferret#nose","9-12-2012")
  end
  def test_getters_clase
    assert_equal("foo://example.com:8042/over/there?name=ferret#nose",@recurso_default.uri)
    assert_equal("9-12-2012",@recurso_default.fecha_creacion)
  end
  def test_to_s
      assert_equal("Recurso: Identificacion: 1 - Marca: marca - Titulo: titulo - Descripcion: descripcion - Experiencia: nivel - Tipo: tipo - Categoria: categoria - Material: material - Temporalizacion: 60 - Conceptos: [\"razonamiento\", \"abstraccion\", \"descomposicion\", \"patrones\", \"algoritmos\", \"codificacion\", \"validacion\"], - URI: foo://example.com:8042/over/there?name=ferret#nose, -Fecha de creacion: 9-12-2012",@recurso_default.to_s)

  end
  def test_herencia_hija
    assert_equal([RecursosEducativos::DigitalesAbiertos, RecursosEducativos::Recurso, Comparable, Object, Kernel, BasicObject],RecursosEducativos::DigitalesAbiertos.herencia_de_clase)
  end

  def test_contar_instancia_hija
    assert_not_equal(0,RecursosEducativos::DigitalesAbiertos.count)
  end

end
