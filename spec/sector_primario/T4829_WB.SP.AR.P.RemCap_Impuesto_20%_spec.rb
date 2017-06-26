require "sector_primario_spec_helper"

describe "WB.SP.AR.P.RemCap Impuesto 20%", :sauce => SPAPP_CONFIG['sauce'] do
  
  include_context "config"
  include_context "login_arrendatario"
  
  it Time.now do
    @driver.find_element(:link, "Captura").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "criteria")).select_by(:text, "Nombre")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "mario"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:css, "tr.even > td.colgris > input[name=\"idCliente\"]").click
    @driver.find_element(:css, "#boton > input[type=\"image\"]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "lstmetodoDePago")).select_by(:text, "Efectivo")
    @driver.find_element(:id, "impuestosRetenidos3").click
    #assert element_present?(:id, "impuestos_2c9c84c535a1f4bf0135a2a0c6040019") == true
    #assert element_present?(:css, "tr.2c9c84c535a1f4bf0135a2a0c6040019 > td.title3 > div") == true
    verify { @driver.find_element(:id, "impuestos_2c95862f293c58e40129417e35d10043").attribute("value").should =~ /^[\s\S]*$/ }
  end
  
end
