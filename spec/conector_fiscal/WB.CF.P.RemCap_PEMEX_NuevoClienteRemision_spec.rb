require "conector_fiscal_spec_helper"

describe "WB.CF.AD.P.RemCap PEMEX Nuevo Cliente Remision", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Captura").click
    @driver.find_element(:xpath, "//table[@class='contorno']/tbody/tr[4]/td/input").click
    @driver.find_element(:xpath, "//td[@class='repdatos']/input[1]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "tipCFD")).select_by(:text, "Factura")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "lstRegimen")).select_by(:text, "Regimen Fiscal General")
    @driver.find_element(:id, "lexpedicion").clear
    @driver.find_element(:id, "lexpedicion").send_keys "Domicilio Privado para efecto de pruebas"
    @driver.find_element(:id, "receptorRfc").clear
    @driver.find_element(:id, "receptorRfc").send_keys "TEST010101TST"
    @driver.find_element(:id, "clienteModel.nombre").clear
    @driver.find_element(:id, "clienteModel.nombre").send_keys "Pruebas Conector Fiscal Diverza"
    @driver.find_element(:id, "clienteModel.domicilio.calle").clear
    @driver.find_element(:id, "clienteModel.domicilio.calle").send_keys "Prueba"
    @driver.find_element(:id, "clienteModel.domicilio.municipio").clear
    @driver.find_element(:id, "clienteModel.domicilio.municipio").send_keys "Prueba"
    @driver.find_element(:id, "clienteModel.domicilio.estado").clear
    @driver.find_element(:id, "clienteModel.domicilio.estado").send_keys "Prueba"
    @driver.find_element(:id, "clienteModel.domicilio.pais").clear
    @driver.find_element(:id, "clienteModel.domicilio.pais").send_keys "Prueba"
    @driver.find_element(:id, "clienteModel.domicilio.codigoPostal").clear
    @driver.find_element(:id, "clienteModel.domicilio.codigoPostal").send_keys "07300"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "lstmetodoDePago")).select_by(:text, "Efectivo")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "addendaCommand.CFD.tipoMoneda")).select_by(:text, "Pesos")
    @driver.find_element(:css, "option[value=\"MXN\"]").click
    #@driver.find_element(:id, "Impuesto Federal Trasladado IVA_16.0_8a8081ae3e8fa904013e8fc051f0000b").click
    @driver.find_element(:name, "impuestosTrasladados").click
    @driver.find_element(:css, "td.subcabezalista > a > img").click
    @driver.find_element(:id, "noIdentificacion").clear
    @driver.find_element(:id, "noIdentificacion").send_keys "1"
    @driver.find_element(:id, "cantidad").clear
    @driver.find_element(:id, "cantidad").send_keys "1"
    @driver.find_element(:id, "medida").clear
    @driver.find_element(:id, "medida").send_keys "1"
    @driver.find_element(:id, "descripcion").clear
    @driver.find_element(:id, "descripcion").send_keys "Prueba Conector Fiscal Diverza"
    @driver.find_element(:id, "unitario").clear
    @driver.find_element(:id, "unitario").send_keys "10.00"
    @driver.find_element(:id, "guardarConcepto").click
    @driver.switch_to.alert.accept
    @driver.find_element(:id, "btnSaveLow").click
    @driver.switch_to.alert.accept
    verify { (@driver.find_element(:xpath, "//table[@class='contorno']/tbody/tr[2]/td[2]/p").text).should == "La Remisión Electrónica ha sido almacenada en su buzón." }
  end
  
end
