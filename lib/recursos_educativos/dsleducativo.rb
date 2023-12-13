module RecursosEducativos
  class DslEducativo
    attr_reader :recursos
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
    #
    #def evaluar_recurso(options = {})
    #end
    #
    #def crear_itinerario()
    #end
    #
    #def to_s()
    #end
  end
end
                       #id   #nombre   #categoria
#dsl = DslEducativo.new(001,'vestibulo',:taller) do
  #registrar 015, 'ull', 'Exploradores...', 'Secuencias',Recursos::INICIAL, :guiada, :desenchufada, 'papel', 30, [:algoritmos], riull, 2023
  #registrar ...
  #registrar...
  #resto de codigo
#end
  
