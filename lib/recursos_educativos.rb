# frozen_string_literal: true

require_relative "recursos_educativos/version"
require "recursos_educativos/recurso"
require "recursos_educativos/digitales_abiertos"
require "recursos_educativos/entorno_digital"
require "recursos_educativos/constantes_recurso"
require "recursos_educativos/entorno_educacion_formal"
require "recursos_educativos/entorno_educacion_informal"
require "recursos_educativos/dsleducativo"
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
        coleccion_actualizada = RecursosEducativos::EntornoDigital.new(entorno.id_code, entorno.nombre, entorno.categoria, recursos_unidos)
        return coleccion_actualizada
      elsif entorno.instance_of?(RecursosEducativos::EntornoEducacionFormal)
        coleccion_actualizada = RecursosEducativos::EntornoEducacionFormal.new(entorno.id_code, entorno.nombre, entorno.categoria, recursos_unidos, entorno.numero_niveles)
        return coleccion_actualizada
      elsif entorno.instance_of?(RecursosEducativos::EntornoEducacionInformal)
        coleccion_actualizada = RecursosEducativos::EntornoEducacionInformal.new(entorno.id_code, entorno.nombre, entorno.categoria, recursos_unidos, entorno.precio)
        return coleccion_actualizada
     end      
    elsif
      nil
    end
  end
end
