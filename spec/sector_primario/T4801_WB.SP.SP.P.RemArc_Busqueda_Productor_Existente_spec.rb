require "sector_primario_spec_helper"

describe "T4801 WB.SP.SP.P.RemArc Busqueda Productor Existente", :sauce => SPAPP_CONFIG['sauce'] do
  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Nombre Productor")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "TOMAS"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:xpath, "//table[@id='remision']//td[.='TOMAS TELIO SALAZAR']").text).should == "TOMAS TELIO SALAZAR" }
    # ERROR: Caught exception [ERROR: Unsupported command [getTable | id=remision.1.1 | ]]
  end
  
end
