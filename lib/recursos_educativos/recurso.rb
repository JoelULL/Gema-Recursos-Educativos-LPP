module RecursosEducativos
  class Recurso
    attr_reader :id, :marca, :titulo, :descripcion, :nivel_experiencia, :tipo_actividad, :categoria,:material, :temporalizacion, :concepto
    def initialize(id, marca, titulo, descripcion, nivel_experiencia,tipo_actividad, categoria, material, temporalizacion, concepto)
      @id = id
      @marca = marca
      @titulo = titulo
      @descripcion = descripcion
      @nivel_experiencia = nivel_experiencia
      @tipo_actividad = tipo_actividad
      @categoria = categoria
      @material = material
      @temporalizacion = temporalizacion
      @concepto = concepto
    end
  end
end
