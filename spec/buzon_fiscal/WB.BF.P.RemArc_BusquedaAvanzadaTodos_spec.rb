require "buzon_fiscal_spec_helper"

describe "WB.BF.P.RemArc Busqueda Avanzada Todos", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    @driver.find_element(:link, "búsqueda avanzada").click
    @driver.find_element(:id, "status1").click
    @driver.find_element(:id, "campo1").clear
    @driver.find_element(:id, "campo1").send_keys "01/01/2014"
    @driver.find_element(:id, "campo2").clear
    @driver.find_element(:id, "campo2").send_keys "31/12/2014"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:xpath, "//table[@class='bannerluis']/tbody/tr/td").text).include?("Resultado") }
  end
  
end
