module RecursosEducativos
  class DslEducativo
    attr_reader :recursos, :evaluaciones, :itinerarios
    def initialize(id_entorno,nombre_entorno,categoria_entorno, &bloque)
      @recursos = []
      @entorno = EntornoDigital.new(id_entorno, nombre_entorno,categoria_entorno, [])
      @evaluaciones = []
      @itinerarios = []
      instance_eval &bloque
    end
    def registrar(id,marca,titulo,descripcion,experiencia,tipo,categoria,material,temporalizacion,conceptos,uri = nil,fecha_creacion = nil)
    if (uri != nil && fecha_creacion != nil)
     recurso_nuevo = DigitalesAbiertos.new(id,marca,titulo,descripcion,experiencia,tipo,categoria,material,temporalizacion,conceptos,uri,fecha_creacion)
      @recursos << recurso_nuevo
      @entorno.coleccion << recurso_nuevo 
    else
      recurso_nuevo = Recurso.new(id,marca,titulo,descripcion,experiencia,tipo,categoria,material,temporalizacion,conceptos)
      @recursos << recurso_nuevo
    end
  end
    def evaluar(calidad, objetivos, motivacion, diseño, usabilidad, accesibilidad, rehusabilidad, valores)
      lori = {RecursosEducativos::CALIDAD_CONTENIDO => calidad,RecursosEducativos::OBJETIVOS_APRENDIZAJE => objetivos, RecursosEducativos::MOTIVACION => motivacion, RecursosEducativos::DISEÑO_PRESENTACION => diseño, RecursosEducativos::USABILIDAD => usabilidad,RecursosEducativos::ACCESIBILIDAD => accesibilidad,RecursosEducativos::REHUSABILIDAD => rehusabilidad,RecursosEducativos::VALOR_EDUCATIVO => valores}
      @evaluaciones << lori
    end
    
    def concepto(concepto)
      if (concepto == 'Secuencias' || concepto == 'Variables' || concepto == 'Bucles' || concepto == 'Condicionales' || concepto == 'Funciones')
        @itinerarios << concepto
      end
    end
    
    def to_s()
     orden_recurso_lori = @entorno.coleccion.zip(@evaluaciones).map { |pair| pair }
     #for element in orden_recurso_lori
       #puts element[0].titulo
     #end
     resultado = orden_recurso_lori.sort_by { |tupla| @itinerarios.index(tupla[0].descripcion)}
    # for element in resultado
      # puts element[0].titulo
     #end
     imprimir = "Itinerario: #{@entorno.nombre}\n"
     resultado.each_with_index do |tupla, indice|
       imprimir += "#{indice + 1}.- #{tupla[0].titulo}, LORI: #{tupla[1]}\n\n"
     end
    imprimir
    end
  end
end
