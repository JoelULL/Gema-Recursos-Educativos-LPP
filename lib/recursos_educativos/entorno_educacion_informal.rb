module RecursosEducativos
  class EntornoEducacionInformal < EntornoDigital
    def initialize(id_code,nombre,categoria,coleccion, precio)
      super(id_code,nombre,categoria,coleccion)
      @precio = precio
    end

  end
end

