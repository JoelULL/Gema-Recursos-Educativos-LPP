# frozen_string_literal: true

require_relative "recursos_educativos/version"
require "recursos_educativos/recurso"
require "recursos_educativos/digitales_abiertos"
require "recursos_educativos/entorno_digital"
require "recursos_educativos/constantes_recurso"
require "recursos_educativos/entorno_educacion_formal"
require "recursos_educativos/entorno_educacion_informal"
#Modulo principal de la gema que representa Recursos educativos.
module RecursosEducativos
  class Error < StandardError; end

#la siguiente funcion recibe un objeto del mismo espacio de nombres y si devuelve el valor del atributo temporalizacion del objeto (recurso).
  def self.obtener_temporalizacion(recurso)
    if recurso.is_a?(RecursosEducativos::Recurso)
      return recurso.temporalizacion
    elsif
      nil
    end
  end
  #En esta funcion podemos obtener la duracion total de una coleccion de recursos perteneciente a un entorno digital. Recorriendo los recursos de la coleccion suma en una variable la temporalizacion de cada uno devolviendo la suma en minutos de todos ellos.  
  def self.obtener_duracion_coleccion(entorno)
    if entorno.is_a?(RecursosEducativos::EntornoDigital)
      duracion = 0
      for recurso in entorno.coleccion
        duracion += recurso.temporalizacion
      end
      return duracion
    elsif
      nil
    end
  end
  #En este metodo polimorfico se obtiene una nueva coleccion con unos recursos nuevos añadidas a su coleccion. Se le pasa el entorno al que iran esos nuevos recursos y los recursos que se desean añadir.
  #Es polimorfico porque en funcion del tipo de entorno que se reciba el comportamiento difiere al crear el nuevo objeto puesto que cada uno de ellos tiene atributos diferentes.
  def self.inclusion_recursos_coleccion(entorno, recursos)
    correct_classes = false
    for recurso in recursos
      if recurso.is_a?(RecursosEducativos::Recurso)
        correct_classes = true
      end
    end
    if entorno.is_a?(RecursosEducativos::EntornoDigital) && correct_classes
      recursos_unidos = entorno.coleccion | recursos
      if entorno.instance_of?(RecursosEducativos::EntornoDigital)
        coleccion_actualizada = RecursosEducativos::EntornoDigital.new(entorno.id_code, entorno.nombre, entorno.categoria, recursos_unidos, entorno.lori)
        return coleccion_actualizada
      elsif entorno.instance_of?(RecursosEducativos::EntornoEducacionFormal)
        coleccion_actualizada = RecursosEducativos::EntornoEducacionFormal.new(entorno.id_code, entorno.nombre, entorno.categoria, recursos_unidos, entorno.numero_niveles,entorno.lori)
        return coleccion_actualizada
      elsif entorno.instance_of?(RecursosEducativos::EntornoEducacionInformal)
        coleccion_actualizada = RecursosEducativos::EntornoEducacionInformal.new(entorno.id_code, entorno.nombre, entorno.categoria, recursos_unidos, entorno.precio,entorno.lori)
        return coleccion_actualizada
     end      
    elsif
      nil
    end
  end
  #Funcion que siguiendo el paradigma de programacion funcional, permite aplicar el instrumento LORI a un recurso digital abierto. Primero se comprueba que efectivamente el recurso al que se le quiere aplicar el LORI sea un recurso digital abierto con instance_of?. Como en la programacion funcional las funciones deben ser puras y no deben modificar objetos, se crea un nuevo objeto con los atributos del que se pasa como parametro y se le añade el nuevo lori. Esta funcion devolvera el recurso con el lori aplicado.
  def RecursosEducativos::aplicar_lori_recurso_digital_abierto(recurso, lori_nuevo)
    if (!recurso.instance_of?(RecursosEducativos::DigitalesAbiertos))
      return nil
    else
      recurso_actualizado = RecursosEducativos::DigitalesAbiertos.new(recurso.id, recurso.marca, recurso.titulo, recurso.descripcion, recurso.nivel_experiencia, recurso.tipo_actividad, recurso.categoria, recurso.material, recurso.temporalizacion, recurso.concepto, recurso.uri, recurso.fecha_creacion, lori_nuevo)
      return recurso_actualizado
    end
  end
  #Siguiendo la misma metodologia e idea que la funcion anterior. Esta funcion permitira aplicar el instrumento LORI a un entorno digital de recursos educativos. Para ello se comprueba primero que sea un entorno digital y luego se procede a crear un nuevo objeto con el lori actualizado que es lo que se devolvera.
  def RecursosEducativos::aplicar_lori_entorno_digital(entorno, lori_nuevo)
      if entorno.instance_of?(RecursosEducativos::EntornoDigital)
        coleccion_actualizada = RecursosEducativos::EntornoDigital.new(entorno.id_code, entorno.nombre, entorno.categoria, entorno.coleccion, lori_nuevo)
        return coleccion_actualizada
      elsif entorno.instance_of?(RecursosEducativos::EntornoEducacionFormal)
        coleccion_actualizada = RecursosEducativos::EntornoEducacionFormal.new(entorno.id_code, entorno.nombre, entorno.categoria, entorno.coleccion, entorno.numero_niveles, lori_nuevo)
        return coleccion_actualizada
      elsif entorno.instance_of?(RecursosEducativos::EntornoEducacionInformal)
        coleccion_actualizada = RecursosEducativos::EntornoEducacionInformal.new(entorno.id_code, entorno.nombre, entorno.categoria, entorno.coleccion, entorno.precio, lori_nuevo)
        return coleccion_actualizada
    else
      nil
    end
  end
  #Funcion que siguiendo el mismo paradigma que las funcions anteriores, (programacion declarativa(funcional)) permite selecionar un recurso que tenga el mayor valor educativo de aquellos que tienen la misma fecha y duracion en minutos.
  def RecursosEducativos::seleccion_recurso(recursos)
    all_objects = recursos.all? { |recurso| recurso.is_a?(RecursosEducativos::DigitalesAbiertos) }
    if all_objects
    recursos.group_by { |recurso| [recurso.fecha_creacion, recurso.temporalizacion] }
      .transform_values{|lista_recursos| lista_recursos.max_by{ |rec| rec.lori[RecursosEducativos::VALOR_EDUCATIVO]}}
      .values
    else
      nil
    end
  end
  #Funcion que sigue el mismo paradigma y metodologia que la anterior. Permite seleccionar el entorno digital de un conjuto de estos que tenga un mayor numero de recursos en su coleccion y/o con mejor calidad de contenido. En caso de que tengan el mismo numero de recursos en la coleccion se escogera aquel con mejor calidad de contenido, si no se eligira aquel con mayor numero de recursos en su coleccion.
  def RecursosEducativos::seleccion_entorno(entornos)
  all_objects = entornos.all? { |entorno| entorno.is_a?(RecursosEducativos::EntornoDigital) }
    if all_objects
      entorno_seleccionado = entornos.max_by do |entorno|
        [entorno.coleccion.size, entorno.lori[RecursosEducativos::CALIDAD_CONTENIDO]]
      end
      entorno_seleccionado
    else
      nil
  end
  end
end
