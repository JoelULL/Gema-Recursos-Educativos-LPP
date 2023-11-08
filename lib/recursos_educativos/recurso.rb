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
    def to_s
      array_string = @concepto.map{|simbolo| simbolo.to_s}
      "Recurso: Identificacion: #{@id} - Marca: #{@marca} - Titulo: #{@titulo} - Descripcion: #{@descripcion} - Experiencia: #{@nivel_experiencia} - Tipo: #{@tipo_actividad} - Categoria: #{@categoria} - Material: #{@material} - Temporalizacion: #{@temporalizacion} - Conceptos: #{array_string}"
    end
  end
end
