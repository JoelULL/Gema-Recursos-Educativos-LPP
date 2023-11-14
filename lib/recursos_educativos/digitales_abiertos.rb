module RecursosEducativos
  class DigitalesAbiertos < Recurso
    attr_reader :uri, :fecha_creacion
    def initialize(id, marca, titulo, descripcion, nivel_experiencia,tipo_actividad, categoria, material, temporalizacion, concepto, uri, fecha_creacion)
          super(id, marca, titulo, descripcion, nivel_experiencia,tipo_actividad, categoria, material, temporalizacion, concepto)
    @uri = uri
    @fecha_creacion = fecha_creacion
    end
  end
end
