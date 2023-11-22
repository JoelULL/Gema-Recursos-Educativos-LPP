module RecursosEducativos
  class EntornoEducacionInformal < EntornoDigital
    attr_reader :precio
    def initialize(id_code,nombre,categoria,coleccion, precio)
      super(id_code,nombre,categoria,coleccion)
      @precio = precio
    end
    def to_s
      nombres_recursos = []
      for recurso in coleccion
        nombres_recursos << recurso.titulo
      end
      "- Id :#{@id_code} - nombre: #{@nombre} -categoria: #{@categoria} -coleccion:#{nombres_recursos.join(', ')},#{@precio}"
    end
  end
end

