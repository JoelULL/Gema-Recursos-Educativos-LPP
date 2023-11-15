module RecursosEducativos
  class EntornoDigital
    attr_reader :id_code, :nombre, :categoria, :coleccion
    def initialize(id_code,nombre,categoria,coleccion = [])
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
    def nivel_medio
      return nil if coleccion.empty?
      niveles = @coleccion.map do |recurso|
        case recurso.nivel_experiencia
        when RecursosEducativos::BEGINNER
          1
        when RecursosEducativos::INTERMEDIATE
          2
        when RecursosEducativos::EXPERT
          3
        end
      end
      nivel_medio = niveles.sum / coleccion.length.to_f
      case nivel_medio.round
      when 1
       RecursosEducativos::BEGINNER
      when 2
        RecursosEducativos::INTERMEDIATE
      when 3
        RecursosEducativos::EXPERT
      else
        RecursosEducativos::BEGINNER
      end
    end
  end
end
