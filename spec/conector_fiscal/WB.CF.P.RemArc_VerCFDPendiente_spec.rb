require "conector_fiscal_spec_helper"

describe "WB.CF.P.RemArc Ver CFD Pendiente", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Cliente")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "Pruebas Conector Fiscal"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:xpath, "//table[@id='remision']//a[.='Status:']").click
    @driver.find_element(:xpath, "//table[@id='remision']//a[.='Status:']").click
    verify { (@driver.find_element(:xpath, "//table[@id='remision']/tbody/tr[1]/td[2]").text).should == "Pruebas Conector Fiscal Diverza" }
    verify { (@driver.find_element(:xpath, "//table[@id='remision']/tbody/tr[1]/td[7]").text).should == "Pendiente" }
    @driver.find_element(:id, "checkboxes.id").click
    @driver.find_element(:css, "img[alt=\"Ver Remision\"]").click
  end
  
end
