require "sector_primario_spec_helper"

describe "T4801 WB.SP.AR.P.RemArc Busqueda Productor Existente", :sauce => SPAPP_CONFIG['sauce'] do
  include_context "config"
  include_context "login_arrendatario"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Nombre Productor")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "RUPERTO"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:xpath, "//table[@id='remision']//td[.='RUPERTO TREVIÑO SAENZ']").text).should == "RUPERTO TREVIÑO SAENZ" }
    # ERROR: Caught exception [ERROR: Unsupported command [getTable | id=remision.1.1 | ]]
  end
  
end
