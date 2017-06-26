require "buzon_fiscal_spec_helper"

describe "WB.BF.P.ComEmi Expedir", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Emisión").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "tipoDocumento")).select_by(:text, "Factura")
    @driver.find_element(:css, "input[type=\"image\"]").click
    @driver.find_element(:id, "razonSocial").clear
    @driver.find_element(:id, "razonSocial").send_keys "Pruebas"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:id, "checkboxes.id").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:xpath, "//table[@id='remision']/tbody/tr[1]/td[5]/select")).select_by(:text, "A")
    @driver.find_element(:id, "expedir").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "Los Comprobantes Fiscales Digitales han sido expedidos y almacenados en su buzón." }
  end
  
end
