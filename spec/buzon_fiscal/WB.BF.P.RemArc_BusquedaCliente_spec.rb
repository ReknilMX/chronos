require "buzon_fiscal_spec_helper"

describe "WB.BF.P.RemArc Busqueda Cliente", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Cliente")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "Pruebas"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:xpath, "//table[@id='remision']//td[.='Pruebas Buzon Fiscal Diverza']").text).should == "Pruebas Buzon Fiscal Diverza" }
  end
  
end
