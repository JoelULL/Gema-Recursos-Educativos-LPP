module RecursosEducativos
  class DslEducativo
    def initialize(nombre, &bloque)
      @nombre = nombre
      @registros = []
      @evaluaciones = []
      @itinerarios = []
      instance_eval &bloque
    end
    #def registrar_recurso()
    #end
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
