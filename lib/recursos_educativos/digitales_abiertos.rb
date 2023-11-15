module RecursosEducativos
  class DigitalesAbiertos < Recurso
    attr_reader :uri, :fecha_creacion
    #include Comparable
    def initialize(id, marca, titulo, descripcion, nivel_experiencia,tipo_actividad, categoria, material, temporalizacion, concepto, uri, fecha_creacion)
          super(id, marca, titulo, descripcion, nivel_experiencia,tipo_actividad, categoria, material, temporalizacion, concepto)
    @uri = uri
    @fecha_creacion = fecha_creacion
    end
    def to_s
      array_string = @concepto.map{|simbolo| simbolo.to_s}
      "Recurso: Identificacion: #{@id} - Marca: #{@marca} - Titulo: #{@titulo} - Descripcion: #{@descripcion} - Experiencia: #{@nivel_experiencia} - Tipo: #{@tipo_actividad} - Categoria: #{@categoria} - Material: #{@material} - Temporalizacion: #{@temporalizacion} - Conceptos: #{array_string}, - URI: #{@uri}, -Fecha de creacion: #{@fecha_creacion}"
    end

    def <=>(otro_objeto)
    # Descomponer las fechas en día, mes y año
    dia, mes, anio = @fecha_creacion.split("-").map(&:to_i)
    otro_dia, otro_mes, otro_anio = otro_objeto.fecha_creacion.split("-").map(&:to_i)

    # Comparar año, mes y día en ese orden
    if anio != otro_anio
      return anio <=> otro_anio
    elsif mes != otro_mes
      return mes <=> otro_mes
    else
      return dia <=> otro_dia
    end
  end
  end
end
