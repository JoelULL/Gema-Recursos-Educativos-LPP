module RecursosEducativos
  class EntornoEducacionFormal < EntornoDigital
    def initialize(id_code,nombre,categoria,coleccion = [],numero_niveles)
      super(id_code,nombre,categoria,coleccion = [])
      @numero_niveles = numero_niveles
    end
  end
end
