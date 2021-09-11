require_relative "equipos"

RSpec.describe Equipos do
  before(:each) do
    @e = Equipos.new
  end
  context "Clase Equipos" do
    it "Inicializar clase equipo" do
      expect(@e).to be_an_instance_of(Equipos)
    end
    it "Validar nombre de equipo" do
      expect(@e.validarNombreEquipo "EQUIPO 3").to eql(3)
    end
    it "Encontrar equipo" do
      expect(@e.encontrarEquipo 3).to eql("EQUIPO 3")
    end
    it "Muestra tabla de equipos" do
      expect(@e.tablaEquipos).to eql("Tabla lista")
    end
  end
end
