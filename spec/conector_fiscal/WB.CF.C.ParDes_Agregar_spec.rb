require "conector_fiscal_spec_helper"

describe "WB.CF.C.ParDes Agregar", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.get(@base_url + "/configuracion/empresa/descuentos.mvc")
    @driver.find_element(:xpath, "//td[@class='boton']/input").click
    @driver.find_element(:name, "descripcion").send_keys "Prueba Descuento 1"
    @driver.find_element(:name, "cantidad").clear
    @driver.find_element(:name, "cantidad").send_keys "01.00"
    @driver.find_element(:xpath, "//td[@class='boton']/input").click
  end
  
end
