require_relative "torneo"

RSpec.describe Torneo do
  before(:each) do
    @torneo = Torneo.new
  end
  context "Clase Torneo" do
    it "inicializar clase Torneo" do
      expect(@torneo).to be_an_instance_of(Torneo)
    end
    it "Registro Participante OK" do
      expect(@torneo.registroParticipante "Ana", 35, "8.107.523-9", "rojo", "Equipo 1").to eql("Registro OK")
    end
    it "Registro Participante FAIL por dni malo" do
      expect(@torneo.registroParticipante "Ana", 35, "8.107.523-8", "rojo", "Equipo 1").to eql("Registro FAIL")
    end
    it "Buscar participante por dni y no se encuentra" do
      expect(@torneo.buscarParticipante "15.124.269-3").to eql("No encontrado")
    end
    it "Buscar participante por dni" do
      @torneo.registroParticipante "Ana", 35, "8.107.523-9", "rojo", "Equipo 1"
      expect(@torneo.buscarParticipante "8.107.523-9").to eql("Encontrado")
    end
    it "Buscar participante por dni invalido" do
      @torneo.registroParticipante "Ana", 35, "8.107.523-9", "rojo", "Equipo 1"
      expect(@torneo.buscarParticipante "8.107.523-8").to eql("Invalido")
    end
    it "Muestra el nombre del participante campeon" do
      expect(@torneo.participanteCampeon).to be >= 1
    end
    it "Muestra la tabla de posiciones" do
      expect(@torneo.tablaPosiciones).to eql("Tabla lista")
    end
    it "Modifica valor de partidas ganadas a dni especifico" do
      expect(@torneo.actualizarPartidasGanadas "18.902.581-5", 6).to eql("Modificacion exitosa")
    end
    it "Modifica valor de partidas ganadas a dni especifico pero no encontrado" do
      expect(@torneo.actualizarPartidasGanadas "15.124.269-3", 6).to eql("DNI no encontrado")
    end
    it "Modifica valor de partidas ganadas a dni invalido" do
      expect(@torneo.actualizarPartidasGanadas "18.902.581-9", 6).to eql("ERROR DNI Invalido")
    end
    it "Modifica valor de partidas ganadas a dni invalido" do
      expect(@torneo.tablaEquipos).to eql("Tabla lista")
    end
  end
end
