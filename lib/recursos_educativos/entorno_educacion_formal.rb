module RecursosEducativos
  class EntornoEducacionFormal < EntornoDigital
    attr_reader :numero_niveles
    def initialize(id_code,nombre,categoria,coleccion,numero_niveles)
      super(id_code,nombre,categoria,coleccion)
      @numero_niveles = numero_niveles
    end
    def to_s
      nombres_recursos = coleccion.map { |recurso| recurso.titulo }
      "- Id :#{@id_code} - nombre: #{@nombre} -categoria: #{@categoria} -coleccion:#{nombres_recursos.join(', ')},#{@numero_niveles}"
    end
  end
end
