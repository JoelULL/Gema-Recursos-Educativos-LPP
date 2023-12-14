module RecursosEducativos
  #Clase que crea un DSL capaz de permitir la interaccion entre recursos educativos y un entorno de recursos educativos de una forma natural. Gracias a las funciones de registrar para registrar recursos, evaluar para poder asociar un LORI a esos recursos y una para poder organizar en base a conceptos los recursos de un itinerario.
  class DslEducativo
    attr_reader :recursos, :evaluaciones, :itinerarios
    def initialize(id_entorno,nombre_entorno,categoria_entorno, &bloque)
      @recursos = []
      @entorno = EntornoDigital.new(id_entorno, nombre_entorno,categoria_entorno, [])
      @evaluaciones = []
      @itinerarios = []
      instance_eval &bloque
    end
    #La funcion registrar recibe los datos de un recurso, lo instancia y luego lo añade al conjunto.
    def registrar(id,marca,titulo,descripcion,experiencia,tipo,categoria,material,temporalizacion,conceptos,uri = nil,fecha_creacion = nil)
    if (uri != nil && fecha_creacion != nil)
     recurso_nuevo = DigitalesAbiertos.new(id,marca,titulo,descripcion,experiencia,tipo,categoria,material,temporalizacion,conceptos,uri,fecha_creacion)
      @recursos << recurso_nuevo
      @entorno.coleccion << recurso_nuevo 
    else
      recurso_nuevo = Recurso.new(id,marca,titulo,descripcion,experiencia,tipo,categoria,material,temporalizacion,conceptos)
      @recursos << recurso_nuevo
      @entorno.coleccion << recurso_nuevo
    end
  end
    #la funcion evaluar recibe los datos de un LORI, instancia un LORI con dichos datos y lo incluye en el conjunto.
    def evaluar(calidad, objetivos, motivacion, diseño, usabilidad, accesibilidad, rehusabilidad, valores)
      lori = {RecursosEducativos::CALIDAD_CONTENIDO => calidad,RecursosEducativos::OBJETIVOS_APRENDIZAJE => objetivos, RecursosEducativos::MOTIVACION => motivacion, RecursosEducativos::DISEÑO_PRESENTACION => diseño, RecursosEducativos::USABILIDAD => usabilidad,RecursosEducativos::ACCESIBILIDAD => accesibilidad,RecursosEducativos::REHUSABILIDAD => rehusabilidad,RecursosEducativos::VALOR_EDUCATIVO => valores}
      @evaluaciones << lori
    end
    #Funcion que recibe como datos los tipos de conceptos necesarios para poder organizar los recursos. Comprueba que el concepto recibido es uno de los validos y si es asi añade al conjunto dicho concepto.
    def concepto(concepto)
      if (concepto == 'Secuencias' || concepto == 'Variables' || concepto == 'Bucles' || concepto == 'Condicionales' || concepto == 'Funciones')
        @itinerarios << concepto
      end
    end
    #Metodo que permite formatear correctamente el objeto. Se mostraran los itinerarios con los recursos y sus loris asi como el nombre del itinerario. Ademas se incluye tambien el indice asociado a cada tupla de {recurso, lori}.Hay que destacar que se muestran los titulos de la coleccion de recursos del entorno instanciado y sus loris asociados, el orden vendra determinado por el conjunto de conceptos.
    def to_s()
     #Primero se asocian los recursos del entorno a las evaluaciones. Para ello utilizamos las funciones zip y map para crear una tupla, se asume que el orden de los recursos en el conjunto y los loris es el mismo.
     orden_recurso_lori = @entorno.coleccion.zip(@evaluaciones).map { |pair| pair }
     # En el resultado se incluyen las tulas {recurso,lori} ordenadas en funcion del conjuto de conceptos.
     resultado = orden_recurso_lori.sort_by { |tupla| @itinerarios.index(tupla[0].descripcion)}
    
     imprimir = "Itinerario: #{@entorno.nombre}\n"
     resultado.each_with_index do |tupla, indice|
       imprimir += "#{indice + 1}.- #{tupla[0].titulo}, LORI: #{tupla[1]}\n\n"
     end
    imprimir
    end
  end
end
