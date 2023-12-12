module RecursosEducativos
  class DslEducativo
    def initialize(nombre, &bloque)
      @nombre = nombre
      @registros = []
      @evaluaciones = []
      @itinerarios = []
      instance_eval &bloque
    end
  end
end
