require "buzon_fiscal_spec_helper"

describe "WB.BF.C.Suc Alta", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.get(@base_url + "/configuracion/empresa/sucursales.mvc")
    @driver.find_element(:css, "input[type=\"image\"]").click
    @driver.find_element(:name, "nombre").clear
    @driver.find_element(:name, "nombre").send_keys "Misterios"
    @driver.find_element(:name, "alias").clear
    @driver.find_element(:name, "alias").send_keys "Misterios"
    @driver.find_element(:name, "titular").clear
    @driver.find_element(:name, "titular").send_keys "Prueba Buzon Fiscal 1"
    @driver.find_element(:name, "ubicacion.calle").clear
    @driver.find_element(:name, "ubicacion.calle").send_keys "Misterios"
    @driver.find_element(:name, "ubicacion.noExterior").clear
    @driver.find_element(:name, "ubicacion.noExterior").send_keys "100"
    @driver.find_element(:name, "ubicacion.noInterior").clear
    @driver.find_element(:name, "ubicacion.noInterior").send_keys "A"
    @driver.find_element(:name, "ubicacion.referencia").clear
    @driver.find_element(:name, "ubicacion.referencia").send_keys "Entre Circuito Interior y Clave"
    @driver.find_element(:name, "ubicacion.colonia").clear
    @driver.find_element(:name, "ubicacion.colonia").send_keys "Peralvillo"
    @driver.find_element(:name, "ubicacion.localidad").clear
    @driver.find_element(:name, "ubicacion.localidad").send_keys "Prueba"
    @driver.find_element(:name, "ubicacion.municipio").clear
    @driver.find_element(:name, "ubicacion.municipio").send_keys "Gustavo A. Madero"
    @driver.find_element(:name, "ubicacion.codigoPostal").clear
    @driver.find_element(:name, "ubicacion.codigoPostal").send_keys "06300"
    @driver.find_element(:name, "ubicacion.estado").clear
    @driver.find_element(:name, "ubicacion.estado").send_keys "Distrito Federal"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "ubicacion.pais")).select_by(:text, "México")
    @driver.find_element(:name, "telefono").clear
    @driver.find_element(:name, "telefono").send_keys "5555925130"
    @driver.find_element(:css, "input[type=\"image\"]").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "La información de la sucursal ha sido registrada." }
  end
  
end
