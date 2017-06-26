require "sector_primario_spec_helper"

describe "T4779 WB.SP.SP.P.RemCap Captura correcta", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"

  it Time.now do
    @driver.find_element(:link, "Captura").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "criteria")).select_by(:text, "RFC")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "RAMA"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:name, "idCliente").click
    @driver.find_element(:css, "#boton > input[type=\"image\"]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "lstmetodoDePago")).select_by(:text, "Efectivo")
    @driver.find_element(:id, "addConcepto").click
    @driver.find_element(:id, "concepto.noIdentificacion").clear
    @driver.find_element(:id, "concepto.noIdentificacion").send_keys "1"
    @driver.find_element(:id, "concepto.cantidad").clear
    @driver.find_element(:id, "concepto.cantidad").send_keys "1"
    @driver.find_element(:id, "concepto.unidad").clear
    @driver.find_element(:id, "concepto.unidad").send_keys "PZA"
    @driver.find_element(:id, "concepto.descripcion").clear
    @driver.find_element(:id, "concepto.descripcion").send_keys "Prueba Diverza SP"
    @driver.find_element(:id, "concepto.valorUnitario").clear
    @driver.find_element(:id, "concepto.valorUnitario").send_keys "1.00"
    @driver.find_element(:id, "concepto.importe").clear
    @driver.find_element(:id, "concepto.importe").send_keys "10.00"
    @driver.find_element(:id, "guardarConcepto").click
    @driver.find_element(:id, "popup_ok").click
    @driver.find_element(:id, "finish").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "La Remisión Electrónica ha sido almacenada en su buzón." }
  end
  
end
