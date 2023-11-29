module RecursosEducativos
  #Clase Digitales Abiertos que hereda de recursos. Se crea esta clase para representar un tipo de recurso. Cuenta con dos atributos nuevos que son el uri y la fecha de creacion. Con esta clase aprendemos el concepto de herencia en Ruby.
  class DigitalesAbiertos < Recurso
    attr_reader :uri, :fecha_creacion, :lori
    def initialize(id, marca, titulo, descripcion, nivel_experiencia,tipo_actividad, categoria, material, temporalizacion, concepto, uri, fecha_creacion, lori)
          super(id, marca, titulo, descripcion, nivel_experiencia,tipo_actividad, categoria, material, temporalizacion, concepto)
    @uri = uri
    @fecha_creacion = fecha_creacion
    @lori = lori
    end
    def to_s
      array_string = @concepto.map{|simbolo| simbolo.to_s}
      "Recurso: Identificacion: #{@id} - Marca: #{@marca} - Titulo: #{@titulo} - Descripcion: #{@descripcion} - Experiencia: #{@nivel_experiencia} - Tipo: #{@tipo_actividad} - Categoria: #{@categoria} - Material: #{@material} - Temporalizacion: #{@temporalizacion} - Conceptos: #{array_string}, - URI: #{@uri}, -Fecha de creacion: #{@fecha_creacion}"
    end
    #Utilizando el modulo de comparable como hicimos en la clase padre, cambiamos el metodo
    #<=> para poder comparar por fecha de creacion este tipo de recursos. Como en la clase padre este metodo tambien esta desarrollado, es una extension de comportamiento es decir, esta clase tambien permite a las instancias poder compararse por temporalizacion.
    def <=>(otro_objeto)
    # Descomponer las fechas en día, mes y año sin utilizar map
    fecha_parts = @fecha_creacion.split("-")
    dia = fecha_parts[0].to_i
    mes = fecha_parts[1].to_i
    anio = fecha_parts[2].to_i

    otro_fecha_parts = otro_objeto.fecha_creacion.split("-")
    otro_dia = otro_fecha_parts[0].to_i
    otro_mes = otro_fecha_parts[1].to_i
    otro_anio = otro_fecha_parts[2].to_i

    # Comparar año, mes y día en ese orden
    if anio != otro_anio
      return anio <=> otro_anio
    elsif mes != otro_mes
      return mes <=> otro_mes
    else
      return dia <=> otro_dia
    end
  end
    def == (other)
      @uri == other.uri 
    end
  end
end
