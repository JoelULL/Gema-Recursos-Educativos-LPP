module RecursosEducativos
  #añadimos una nueva clase a la familia que creamos a partir de entorno digital. Se ha creado la clase con la finalidad de poder representar un enorto digital formal.
  class EntornoEducacionFormal < EntornoDigital
    attr_reader :numero_niveles
    def initialize(id_code,nombre,categoria,coleccion,numero_niveles)
      super(id_code,nombre,categoria,coleccion)
      @numero_niveles = numero_niveles
    end
    #Se define el metodo to_s para la clase. En las pruebas es uno de los metodos que hace probar el polimorfismo ya que el comportamiento de este metodo cambia entre las clases. Como se puede ver se muestra el atributo nuevo en este caso el numero de niveles de la coleccion.
    def to_s
      nombres_recursos = []
      for recurso in coleccion
        nombres_recursos << recurso.titulo
      end
      "- Id :#{@id_code} - nombre: #{@nombre} -categoria: #{@categoria} -coleccion:#{nombres_recursos.join(', ')},#{@numero_niveles}"
    end
  end
end
