module RecursosEducativos
  #clase para representar un recurso. en un modulo de recursos educativos. Este tipo de recurso es de  #pensamiento computacional. Se ha de instanciar con los argumentos: identificador, marca, titulo, descripcion, nivel de experiencia, tipo de actividad, categoria del recursos, material necesario, temporalizacion y conceptos.
  class Recurso
    include Comparable
    #getters del objeto
    attr_reader :id, :marca, :titulo, :descripcion, :nivel_experiencia, :tipo_actividad, :categoria,:material, :temporalizacion, :concepto
    def initialize(id, marca, titulo, descripcion, nivel_experiencia,tipo_actividad, categoria, material, temporalizacion, concepto)
      @id = id
      @marca = marca
      @titulo = titulo
      @descripcion = descripcion
      @nivel_experiencia = nivel_experiencia
      @tipo_actividad = tipo_actividad
      @categoria = categoria
      @material = material
      @temporalizacion = temporalizacion
      @concepto = concepto
      if defined?(@@numero_de_recursos)
        @@numero_de_recursos += 1
      else
        @@numero_de_recursos = 1
      end
    end
    #metodo to_s para mostrar el contenido de los parametros del objeto recurso.
    def to_s
      array_string = @concepto.map{|simbolo| simbolo.to_s}
      "Recurso: Identificacion: #{@id} - Marca: #{@marca} - Titulo: #{@titulo} - Descripcion: #{@descripcion} - Experiencia: #{@nivel_experiencia} - Tipo: #{@tipo_actividad} - Categoria: #{@categoria} - Material: #{@material} - Temporalizacion: #{@temporalizacion} - Conceptos: #{array_string}"
    end
    #metodo para comprobar la herencia de clases
    def self.herencia_de_clase
      self.ancestors
    end
    #metodo de clase para contar instancias
    def self.count
      @@numero_de_recursos
    end
    def <=>(other)
      @temporalizacion <=> other.temporalizacion
    end
  end
end
