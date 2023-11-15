module RecursosEducativos
  class EntornoDigital
    attr_reader :id_code, :nombre, :categoria, :coleccion
    def initialize(id_code,nombre,categoria,coleccion)
      @id_code = id_code
      @nombre = nombre
      @categoria = categoria
      @coleccion = coleccion
    end
    def to_s
      nombres_recursos = coleccion.map { |recurso| recurso.titulo }
      "- Id :#{@id_code} - nombre: #{@nombre} -categoria: #{@categoria} -coleccion:#{nombres_recursos.join(', ')}"
    end
    def numero_de_recursos_coleccion
      @coleccion.size
    end
  end
end
