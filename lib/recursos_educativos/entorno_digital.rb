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
      nombres_recursos = coleccion.map { |recurso| recurso.nombre }
      "- Id :#{@id_code} - nombre: #{@nombre} -categoria: #{@categoria} -coleccion:#{nombres_recursos.join(', ')}"
    end
  end
end
