require "sector_primario_spec_helper"

describe "T4790 WB.SP.SP.P.ComAEm Busqueda Avanzada", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Archivo Emitidos").click
    @driver.find_element(:link, "búsqueda avanzada").click
    @driver.find_element(:id, "razonSocial").clear
    @driver.find_element(:id, "razonSocial").send_keys "TOMAS"
    @driver.find_element(:id, "campo1").clear
    @driver.find_element(:id, "campo1").send_keys "01/01/2014"
    @driver.find_element(:id, "campo2").clear
    @driver.find_element(:id, "campo2").send_keys "31/12/2014"
    @driver.find_element(:name, "_target1").click
    verify { (@driver.find_element(:xpath, "//table[@id='cfd']/tbody/tr/td[3]").text).should == "TOMAS TELIO SALAZAR" }
  end
  
end
