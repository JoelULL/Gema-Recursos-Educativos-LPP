# frozen_string_literal: true

require_relative "recursos_educativos/version"
require "recursos_educativos/recurso"
require "recursos_educativos/digitales_abiertos"
require "recursos_educativos/entorno_digital"
require "recursos_educativos/constantes_recurso"
#Modulo principal de la gema que representa Recursos educativos.
module RecursosEducativos
  class Error < StandardError; end
  # Your code goes here...
#la siguiente funcion recibe un objeto del mismo espacio de nombres y si devuelve el valor del atributo temporalizacion del objeto (recurso).
  def self.obtener_temporalizacion(recurso)
    return recurso.temporalizacion
  end
end
