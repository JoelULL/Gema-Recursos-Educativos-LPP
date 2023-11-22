module RecursosEducativos
  class EntornoEducacionInformal < EntornoDigital
    attr_reader :precio
    def initialize(id_code,nombre,categoria,coleccion, precio)
      super(id_code,nombre,categoria,coleccion)
      @precio = precio
    end
  end
end

