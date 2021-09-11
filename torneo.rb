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
