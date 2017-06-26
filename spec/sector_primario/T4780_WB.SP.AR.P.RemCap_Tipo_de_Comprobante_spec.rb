require "sector_primario_spec_helper"

describe "T4780 WB.SP.AR.P.RemCap Tipo de Comprobante", :sauce => SPAPP_CONFIG['sauce'] do
  
  include_context "config"
  include_context "login_arrendatario"
  
  it Time.now do
    @driver.find_element(:link, "Captura").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "criteria")).select_by(:text, "Nombre")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "Empresa"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:css, "#boton > input[type=\"image\"]").click
    verify { Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "tipCFD")).select_by(:text, "Factura") }
    verify { Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "tipCFD")).select_by(:text, "Nota de Credito") }
    #verify { (Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "tipCFD")).select_by(:text, "Factura para Sector Primario")).should be_false }    
  end
  
end
