require_relative "participantes"

RSpec.describe Participantes do
  before(:each) do
    @p = Participantes.new
  end
  context "Clase Participantes" do
    it "Inicializar Participantes" do
      expect(@p).to be_an_instance_of(Participantes)
    end
    it "Muestra variable listaParticipante" do
      expect(@p.listaParticipantes).to eql({})
    end
    it "Registra un participante" do
      expect(@p.registroParticipante "Noelia", 27, "18.902.581-5", "negro", "Equipo 6").to eql("Registro OK")
    end
    it "Registra un participante con DNI erroneo" do
      expect(@p.registroParticipante "Noelia", 27, "18.902.581-7", "negro", "Equipo 6").to eql("Registro FAIL")
    end
    it "Modifica valor de partidas ganadas a dni especifico" do
      expect(@p.actualizarPartidasGanadas "18.902.581-5", 6).to eql("Modificacion exitosa")
    end
    it "Modifica valor de partidas ganadas a dni especifico pero no encontrado" do
      expect(@p.actualizarPartidasGanadas "15.124.269-3", 6).to eql("DNI no encontrado")
    end
    it "Modifica valor de partidas ganadas a dni invalido" do
      expect(@p.actualizarPartidasGanadas "18.902.581-9", 6).to eql("ERROR DNI Invalido")
    end
    it "Muestra tabla de posiciones" do
      expect(@p.tablaPosiciones).to eql("Tabla lista")
    end
    it "Encuentra color" do
      expect(@p.encontrarColor 1).to eql("ROJO")
    end
    it "Encuantra al o los participantes campeones" do
      expect(@p.participanteCampeon).to eql(1)
    end
    it "Busca participante en lista" do
      expect(@p.buscarParticipante "18.902.581-5").to eql("Encontrado")
    end
    it "Busca participante en lista que no esta" do
      expect(@p.buscarParticipante "16.131.790-k").to eql("No encontrado")
    end
    it "Busca participante en lista de un dni invalido" do
      expect(@p.buscarParticipante "18.902.581-6").to eql("Invalido")
    end
    it "Numero aleatorio" do
      expect(@p.aleatorio 0, 7).to be_an_instance_of(Array)
    end
    it "Digito verificador" do
      expect(@p.digito_verificador "16.131.790").to eql("K")
    end
    it "validar DNI con DNI correcto" do
      expect(@p.validar "16131790-k").to eql([true, 16131790, "K"])
    end
    it "validar DNI con DNI incorrecto" do
      expect(@p.validar "16131790-0").to eql([false, nil, nil])
    end
    it "validar color" do
      expect(@p.validarColor "negro").to eql(8)
    end
  end
end
