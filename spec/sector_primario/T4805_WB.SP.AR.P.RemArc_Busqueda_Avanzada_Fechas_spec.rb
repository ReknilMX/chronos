require "sector_primario_spec_helper"

describe "T4805 WB.SP.AR.P.RemArc Busqueda Avanzada Fechas", :sauce => SPAPP_CONFIG['sauce'] do
  
  include_context "config"
  include_context "login_arrendatario"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    @driver.find_element(:link, "búsqueda avanzada").click
    @driver.find_element(:id, "campo1").clear
    @driver.find_element(:id, "campo1").send_keys "01/01/2014"
    @driver.find_element(:id, "campo2").clear
    @driver.find_element(:id, "campo2").send_keys "31/12/2014"
    @driver.find_element(:name, "busqueda").click
    assert @driver.find_element(:css, "table.bannerluis > tbody > tr > td").text.should =~ /Resultados encontrados:/
  end
  
end
