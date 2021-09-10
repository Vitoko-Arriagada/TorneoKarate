require_relative "participantes"

class Equipos
  attr_accessor :codigoEquipo, :equipos

  def initialize
    @codigoEquipo = 1
    @equipos = {
      "EQUIPO 1" => 1,
      "EQUIPO 2" => 2,
      "EQUIPO 3" => 3,
      "EQUIPO 4" => 4,
      "EQUIPO 5" => 5,
      "EQUIPO 6" => 6,
      "EQUIPO 7" => 7,
    }
  end

  def validarNombreEquipo(equipo)
    equipo.upcase!
    return @equipos[equipo]
  end

  def encontrarEquipo(codigoEquipo)
    equipo = @equipos.each {
      |key, value|
      if value == codigoEquipo
        return key
      end
    }
    return equipo
  end

  def tablaEquipos
    p = Participantes.new
    puntaje = []
    puntos = 0
    @equipos.each {
      |key, value|
      p.listaParticipantes.each {
        |id, data|
        if value == data[:idEquipo]
          puntos = puntos + data[:puntaje]
        end
      }
      puntaje.push(puntos)
      puntos = 0
    }
    puts "\n\tTabla de equipos: "
    puts "\n\n\t|\tLista de Equipos\t|\tPuntaje Total\t|"
    puts "\t|-------------------------------------------------------|"
    @equipos.each {
      |equipo, codigo|
      puts "\t|\t    #{equipo}\t\t|\t    #{puntaje[codigo - 1]}\t\t|"
    }
    return "Tabla lista"
  end
end
