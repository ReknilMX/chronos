require "conector_fiscal_spec_helper"

describe "WB.CF.P.RemArc Busqueda Avanzada Pendientes", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    @driver.find_element(:link, "búsqueda avanzada").click
    @driver.find_element(:id, "status2").click
    @driver.find_element(:id, "campo1").clear
    @driver.find_element(:id, "campo1").send_keys "01/01/2014"
    @driver.find_element(:id, "campo2").clear
    @driver.find_element(:id, "campo2").send_keys "31/12/2018"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:xpath, "//table[@id='remision']/tbody/tr[1]/td[8]").text).should == "Pendiente" }
    verify { (@driver.find_element(:xpath, "//table[@class='bannerluis']/tbody/tr/td").text).include?("Resultado") }
  end
  
end
