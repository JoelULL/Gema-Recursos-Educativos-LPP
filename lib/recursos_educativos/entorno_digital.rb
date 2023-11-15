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
    def nivel_medio
      # Asociar un número a cada nivel de dificultad directamente
      valores_niveles = {
        RecursosEducativos::BEGINNER => 1,
        RecursosEducativos::INTERMEDIATE => 2,
        RecursosEducativos::EXPERT => 3
      }
      valores = (@coleccion.categoria).map { |nivel| valores_niveles[nivel] }

      # Calcula el promedio dividiendo la suma total por la cantidad de elementos
      promedio = valores.sum.to_f / valores.size
      case promedio
      when 0..1
        RecursosEducativos::BEGINNER
      when 2
        RecursosEducativos::INTERMEDIATE
      else
        RecursosEducativos::EXPERT
      end
    end
  end
end
