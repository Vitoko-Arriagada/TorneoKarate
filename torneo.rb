require_relative "equipos"
require_relative "participantes"

class Torneo
  def initialize
    @e = Equipos.new
    @p = Participantes.new
  end

  def registroParticipante(nombre, edad, dni, color, equipo)
    @p.registroParticipante(nombre, edad, dni, color, equipo)
  end

  def buscarParticipante(dni)
    @p.buscarParticipante dni
  end

  def participanteCampeon
    @p.participanteCampeon
  end

  def tablaPosiciones
    @p.tablaPosiciones
  end

  def actualizarPartidasGanadas(dni, pGanadas)
    @p.actualizarPartidasGanadas dni, pGanadas
  end

  def tablaEquipos
    @e.tablaEquipos
  end
end

# Declara una clase Torneo
torneo = Torneo.new

#Registra 28 participantes especificando Nombre, Edad, DNI, Color Cinturon, Equipo
torneo.registroParticipante "Ana", 35, "8.107.523-9", "rojo", "Equipo 1"
torneo.registroParticipante "Olga", 40, "20.780.273-5", "negro", "Equipo 2"
torneo.registroParticipante "Jorge", 30, "19.364.953-k", "amarillo", "Equipo 3"
torneo.registroParticipante "Walter", 20, "5.558.904-6", "zual", "Equipo 4"
torneo.registroParticipante "Jaime", 21, "23.985.117-7", "naranjo", "Equipo 5"
torneo.registroParticipante "Omar", 18, "17.165.338-k", "naranja", "Equipo 6"
torneo.registroParticipante "Aquiles", 19, "13.671.510-0", "verde", "Equipo 7"
torneo.registroParticipante "Luis", 18, "23.237.758-5", "morado", "Equipo 1"
torneo.registroParticipante "Victor", 30, "19.275.494-1", "blanco", "Equipo 2"
torneo.registroParticipante "Jose", 31, "6.532.994-8", "azul", "Equipo 3"
torneo.registroParticipante "Dora", 24, "12.623.274-8", "rojo", "Equipo 4"
torneo.registroParticipante "Leo", 34, "23.081.919-k", "rojo", "Equipo 5"
torneo.registroParticipante "Claudia", 20, "7.390.911-2", "amarillo", "Equipo 6"
torneo.registroParticipante "Julio", 24, "21.720.095-4", "marron", "Equipo 7"
torneo.registroParticipante "Cristian", 25, "10.955.633-5", "negro", "Equipo 1"
torneo.registroParticipante "Sofia", 26, "19.181.537-8", "blanco", "Equipo 2"
torneo.registroParticipante "Teresa", 28, "13.761.232-1", "naranjo", "Equipo 3"
torneo.registroParticipante "Javier", 33, "22.980.062-0", "cafe", "Equipo 4"
torneo.registroParticipante "Amanda", 32, "6.506.206-2", "marron", "Equipo 5"
torneo.registroParticipante "Hilda", 40, "21.041.601-3", "cafe", "Equipo 6"
torneo.registroParticipante "Manuel", 33, "8.624.384-9", "azul", "Equipo 7"
torneo.registroParticipante "Roberto", 46, "17.281.808-0", "amarillo", "Equipo 1"
torneo.registroParticipante "Cecilia", 26, "11.303.462-9", "marron", "Equipo 2"
torneo.registroParticipante "Agustina", 36, "14.543.684-2", "rojo", "Equipo 3"
torneo.registroParticipante "Joel", 32, "19.747.568-4", "blanco", "Equipo 4"
torneo.registroParticipante "Raul", 49, "23.549.201-6", "negro", "Equipo 5"
torneo.registroParticipante "Noelia", 27, "18.902.581-5", "negro", "Equipo 6"
torneo.registroParticipante "Noemi", 32, "17.007.720-2", "morado", "Equipo 7"

#Busca participante especificando el DNI como parametro
torneo.buscarParticipante "16131790-k" # Ejemplo - No encontrado
torneo.buscarParticipante "189025815" # Ejemplo - Encontrado

#Muestra en pantalla al participante campeon, por estadistica puede se uno o mas de uno
torneo.participanteCampeon

#Muestra tabla de todos los participantes ordenado de mayor puntaje a menor puntaje
torneo.tablaPosiciones

#Modifica las partidas ganadas de un participante especificando su DNI
torneo.buscarParticipante "189025815" # Informacion antes de la modificacion
torneo.actualizarPartidasGanadas "18.902.581-5", 6 # Modificando las partidas ganadas a 6
torneo.buscarParticipante "189025815" # Informacion despues de la modificacion

#Muestra tabla de equipos junto a su puntaje total obtenidos por sus participantes (4 participantes por equipo)
torneo.tablaEquipos
