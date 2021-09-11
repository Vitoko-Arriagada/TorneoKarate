require_relative "equipos"

class Participantes
  attr_accessor :codigoParticipante, :participantes
  @@participantes = Hash.new

  def initialize
    @e = Equipos.new
    @codigoParticipante = 1

    @colores = {
      "BLANCO" => 0,
      "ROJO" => 1,
      "AMARILLO" => 2,
      "NARANJO" => 3,
      "VERDE" => 4,
      "AZUL" => 5,
      "MORADO" => 6,
      "CAFE" => 7,
      "NEGRO" => 8,
    }
  end

  def registroParticipante(nombre, edad, dni, color, equipo)
    dniValidado = validar(dni)
    colorValidado = validarColor(color)
    equipoValido = @e.validarNombreEquipo(equipo)
    if (dniValidado[0] && nombre != nil && edad != nil && color != nil)
      valores = aleatorio(0, 7)
      @@participantes.merge!(
        "#{@codigoParticipante}": {
          "nombre": nombre,
          "edad": edad,
          "dni": "#{dniValidado[1]}-#{dniValidado[2]}",
          "color": colorValidado,
          "pGanadas": valores[0],
          "pEmpatadas": valores[1],
          "pPerdidas": valores[2],
          "puntaje": (valores[0] * 4) + (valores[1] * 3),
          "idEquipo": equipoValido,
        },
      )
      @codigoParticipante += 1
      return "Registro OK"
    end
    return "Registro FAIL"
  end

  def validarColor(color)
    color.upcase!
    return @colores[color]
  end

  def validar(dni)
    dni.upcase!
    if (dni.split("-")[1] == nil)
      dniIngresado = dni.slice(0, dni.length - 1).gsub(".", "").to_i
      digitoVerificadorIngresado = dni.slice(dni.length - 1)
      #puts dniIngresado, digitoVerificadorIngresado
      #puts digito_verificador(dniIngresado)
    else
      dniIngresado = dni.split("-")[0].gsub(".", "").to_i
      digitoVerificadorIngresado = dni.split("-")[1]
      #puts dniIngresado, digitoVerificadorIngresado
      #puts digito_verificador(dniIngresado)
    end
    if digito_verificador(dniIngresado).to_s == digitoVerificadorIngresado.to_s
      [true, dniIngresado, digitoVerificadorIngresado]
    else
      [false, nil, nil]
    end
  end

  def digito_verificador(rut)
    [*0..9, "K"][rut.to_s.gsub(".", "").reverse.chars.inject([0, 0]) { |(i, a), n| [i + 1, a - n.to_i * (i % 6 + 2)] }[1] % 11]
  end

  def aleatorio(inicio, fin)
    ganados = rand(inicio..fin)
    perdidos = rand(inicio..(fin - ganados))
    empatados = fin - (ganados + perdidos)
    return [ganados, empatados, perdidos]
  end

  def buscarParticipante(dni)
    dniValidado = validar(dni)
    encontrado = [false, nil]
    if dniValidado[0]
      @@participantes.each { |key, value|
        if value[:dni] == "#{dniValidado[1]}-#{dniValidado[2]}"
          encontrado = [true, key]
        end
      }
      if encontrado[0]
        print "\n\tParticipante #{@@participantes[encontrado[1]][:nombre]}"
        print " N° #{encontrado[1]}"
        print " DNI: #{@@participantes[encontrado[1]][:dni]}"
        print ", Cinturon #{encontrarColor(@@participantes[encontrado[1]][:color])}"
        print ", Partidas Ganadas: #{@@participantes[encontrado[1]][:pGanadas]}"
        print ", Partidas Empatadas: #{@@participantes[encontrado[1]][:pEmpatadas]}"
        print ", Partidas Perdidas: #{@@participantes[encontrado[1]][:pPerdidas]}"
        print ", Puntaje Total: #{@@participantes[encontrado[1]][:puntaje]}"
        print ", Equipo: #{@e.encontrarEquipo(@@participantes[encontrado[1]][:idEquipo])}\n"
        return "Encontrado"
      else
        puts "\n\tParticipante #{dniValidado[1]}-#{dniValidado[2]} no encontrado\n"
        return "No encontrado"
      end
    else
      return "Invalido"
    end
  end

  def participanteCampeon
    sub = Hash.new
    @@participantes.each { |key1, value1|
      sub.merge!(
        "#{key1}": value1[:puntaje],
      )
    }
    arreglo = []
    maximo = sub.max_by { |k, v| v }
    sub.each { |key2, value2|
      if value2 == maximo[1]
        arreglo.push(key2)
      end
    }
    if arreglo.size == 1
      puts "\n\tEl participante Campeon es:"
    else
      puts "\n\tLos participantes Campeones son:"
    end
    arreglo.each { |x|
      datos = @@participantes.select { |key, value|
        key == x
      }
      puts "\t\t#{datos[x][:nombre]},\t DNI: #{datos[x][:dni]} con #{datos[x][:puntaje]} puntos."
    }
    return arreglo.size
  end

  def encontrarColor(codigoColor)
    color = @colores.each {
      |key, value|
      if value == codigoColor
        return key
      end
    }
    return color
  end

  def tablaPosiciones
    puts "\n\tTabla de posiciones: "
    puts "\n\t|    Puntaje\t\t| Nombre Participante\t| EQUIPO\t|"
    puts "\t|---------------------------------------------------------------|"
    data = @@participantes.sort_by {
      |id, valor|
      valor[:puntaje]
    }.reverse
    data.each {
      |key, value|
      puts "\t|        #{value[:puntaje]}\t\t|   #{value[:nombre]}   \t\t| #{@e.encontrarEquipo(value[:idEquipo])}\t|"
    }
    return "Tabla lista"
  end

  def actualizarPartidasGanadas(dni, pGanadas)
    if pGanadas < 0
      pGanadas = 0
    end
    if pGanadas > 7
      pGanadas = 7
    end

    dniValidado = validar(dni)
    encontrado = [false, nil]
    if dniValidado[0]
      @@participantes.each { |key, value|
        if value[:dni] == "#{dniValidado[1]}-#{dniValidado[2]}"
          encontrado = [true, key]
        end
      }
      if encontrado[0]
        pPerdidas = rand(0..(7 - pGanadas))
        pEmpatadas = 7 - (pGanadas + pPerdidas)
        @@participantes[encontrado[1]][:pGanadas] = pGanadas
        @@participantes[encontrado[1]][:pPerdidas] = pPerdidas
        @@participantes[encontrado[1]][:pEmpatadas] = pEmpatadas
        @@participantes[encontrado[1]][:puntaje] = (pGanadas * 4) + (pEmpatadas * 3)
        return "Modificacion exitosa"
      else
        puts "\n\tParticipante #{dniValidado[1]}-#{dniValidado[2]} no encontrado\n"
        return "DNI no encontrado"
      end
    else
      return "ERROR DNI Invalido"
    end
  end

  def listaParticipantes
    @@participantes
  end
end
