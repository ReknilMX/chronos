require "conector_fiscal_spec_helper"

describe "WB.CF.P.ComAEm Busqueda Avanzada Fechas", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo Emitidos").click
    @driver.find_element(:link, "búsqueda avanzada").click
    @driver.find_element(:id, "status_CFD1").click
    @driver.find_element(:id, "campo1").clear
    @driver.find_element(:id, "campo1").send_keys "01/01/2014"
    @driver.find_element(:id, "campo2").clear
    @driver.find_element(:id, "campo2").send_keys "21/04/2014"
    @driver.find_element(:name, "_target1").click
    verify { @driver.find_element(:css, "table.bannerluis > tbody > tr > td").text.include?("Resultado") }
  end
  
end
