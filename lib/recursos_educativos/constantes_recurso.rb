#Constantes utilizadas. Se representa el nivel de los recursos
module RecursosEducativos
  BEGINNER = :beginner
  INTERMEDIATE = :intermediate
  EXPERT = :expert
  #Estas constantes se definen para poder crear el atributo que permite representar el instrumento LORI de aquellas clases que lo necesiten. Este instrumento dispone de 8 criterios y cada uno de estos criterios se ha creado a modo de constante en este fichero para poder realizar el hash correspondiente
  CALIDAD_CONTENIDO = :calidad_contenido
  OBJETIVOS_APRENDIZAJE = :objetivos_aprendizaje
  MOTIVACION = :motivacion
  DISEÑO_PRESENTACION = :diseño_presentacion
  USABILIDAD = :usabilidad
  ACCESIBILIDAD = :accesibilidad
  REHUSABILIDAD = :rehusabilidad
  VALOR_EDUCATIVO = :valor_educativo
end
