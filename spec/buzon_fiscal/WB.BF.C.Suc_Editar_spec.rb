require "buzon_fiscal_spec_helper"

describe "WB.BF.C.Suc Editar", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.get(@base_url + "/configuracion/empresa/sucursales.mvc")
    @driver.find_element(:xpath, "//tr[@class='odd']/td[3]/a/img").click
    @driver.find_element(:name, "nombre").clear
    @driver.find_element(:name, "nombre").send_keys "Vallejo"
    @driver.find_element(:name, "alias").clear
    @driver.find_element(:name, "alias").send_keys "Vallejo"
    @driver.find_element(:name, "ubicacion.calle").clear
    @driver.find_element(:name, "ubicacion.calle").send_keys "Vallejo"
    @driver.find_element(:name, "ubicacion.noExterior").clear
    @driver.find_element(:name, "ubicacion.noExterior").send_keys "200"
    @driver.find_element(:name, "ubicacion.noInterior").clear
    @driver.find_element(:name, "ubicacion.noInterior").send_keys "B"
    @driver.find_element(:name, "ubicacion.referencia").clear
    @driver.find_element(:name, "ubicacion.referencia").send_keys "Pruebas"
    @driver.find_element(:name, "ubicacion.colonia").clear
    @driver.find_element(:name, "ubicacion.colonia").send_keys "Prueba"
    @driver.find_element(:name, "ubicacion.localidad").clear
    @driver.find_element(:name, "ubicacion.localidad").send_keys "Prueba2"
    @driver.find_element(:name, "ubicacion.municipio").clear
    @driver.find_element(:name, "ubicacion.municipio").send_keys "G.A.M."
    @driver.find_element(:name, "ubicacion.codigoPostal").clear
    @driver.find_element(:name, "ubicacion.codigoPostal").send_keys "06000"
    @driver.find_element(:name, "ubicacion.estado").clear
    @driver.find_element(:name, "ubicacion.estado").send_keys "D.F."
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "ubicacion.pais")).select_by(:text, "México")
    @driver.find_element(:name, "telefono").clear
    @driver.find_element(:name, "telefono").send_keys "00000000"
    @driver.find_element(:css, "input[type=\"image\"]").click
  end
  
end
