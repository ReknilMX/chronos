require "conector_fiscal_spec_helper"

describe "WB.CF.P.RemArc Busqueda Cliente", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Cliente")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "Pruebas"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:xpath, "//table[@id='remision']//td[.='Pruebas Conector Fiscal Diverza']").text).should == "Pruebas Conector Fiscal Diverza" }
  end
  
end
