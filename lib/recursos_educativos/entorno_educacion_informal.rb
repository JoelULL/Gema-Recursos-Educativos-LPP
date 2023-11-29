module RecursosEducativos
  #Se crea esta clase para su inclusion en la familia de EntornoDigital.Se trata de una clase que permitira representar un entorno digital informal.
  class EntornoEducacionInformal < EntornoDigital
    attr_reader :precio
    def initialize(id_code,nombre,categoria,coleccion, precio,lori)
      super(id_code,nombre,categoria,coleccion,lori)
      @precio = precio
    end
    #se define el metodo to_s de la clase. Como se especifico en la otra clase hija con este metodo en las pruebas podremos comprobar el polimorfismo ya que este metodo tiene aqui otro comportamiento diferente al mostrar el nuevo atributo propio de esta clase, en este caso este atributo es el precio.
    def to_s
      nombres_recursos = []
      for recurso in coleccion
        nombres_recursos << recurso.titulo
      end
      "- Id :#{@id_code} - nombre: #{@nombre} -categoria: #{@categoria} -coleccion:#{nombres_recursos.join(', ')},#{@precio}"
    end
  end
end

