require "sector_primario_spec_helper"

describe "T4828 WB.SP.SP.P.RemCap Sin Impuestos", :sauce => SPAPP_CONFIG['sauce'] do
  
  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Captura").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "criteria")).select_by(:text, "Nombre")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "mario"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:css, "tr.even > td.colgris > input[name=\"idCliente\"]").click
    @driver.find_element(:css, "#boton > input[type=\"image\"]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "lstmetodoDePago")).select_by(:text, "Efectivo")
    assert element_present?(:id, "impuestosRetenidos3") == false
  end
  
end
