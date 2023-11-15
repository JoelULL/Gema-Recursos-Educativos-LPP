module RecursosEducativos
  class DigitalesAbiertos < Recurso
    attr_reader :uri, :fecha_creacion
    def initialize(id, marca, titulo, descripcion, nivel_experiencia,tipo_actividad, categoria, material, temporalizacion, concepto, uri, fecha_creacion)
          super(id, marca, titulo, descripcion, nivel_experiencia,tipo_actividad, categoria, material, temporalizacion, concepto)
    @uri = uri
    @fecha_creacion = fecha_creacion
    end
    def to_s
      array_string = @concepto.map{|simbolo| simbolo.to_s}
      "Recurso: Identificacion: #{@id} - Marca: #{@marca} - Titulo: #{@titulo} - Descripcion: #{@descripcion} - Experiencia: #{@nivel_experiencia} - Tipo: #{@tipo_actividad} - Categoria: #{@categoria} - Material: #{@material} - Temporalizacion: #{@temporalizacion} - Conceptos: #{array_string}, - URI: #{@uri}, -Fecha de creacion: #{@fecha_creacion}"
    end

    def <=>(otro)
      fecha_creacion <=> fecha_creacion
    end
  end
end
