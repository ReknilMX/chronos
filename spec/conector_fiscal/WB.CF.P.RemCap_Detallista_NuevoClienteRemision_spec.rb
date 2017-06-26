require "conector_fiscal_spec_helper"

describe "WB.CF.AD.P.RemCap Detallista Nuevo Cliente Remision", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Captura").click
    @driver.find_element(:xpath, "//table[@class='contorno']/tbody/tr[3]/td/input").click
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
    #@driver.find_element(:id, "Impuesto Federal Trasladado IVA_16.0_8a8081ae3e8fa904013e8fc051f0000b").click
    @driver.find_element(:name, "impuestosTrasladados").click
    @driver.find_element(:id, "detallista.buyer.gln").clear
    @driver.find_element(:id, "detallista.buyer.gln").send_keys "Prueba Conector Fiscal A"
    @driver.find_element(:id, "detallista.buyer.contactInformation.personOrDepartmentName.text").clear
    @driver.find_element(:id, "detallista.buyer.contactInformation.personOrDepartmentName.text").send_keys "Pruebas Conector Fiscal Diverza"
    @driver.find_element(:id, "detallista.seller.gln").clear
    @driver.find_element(:id, "detallista.seller.gln").send_keys "Prueba Conector Fiscal A"
    @driver.find_element(:id, "detallista.seller.alternatePartyIdentification.value").clear
    @driver.find_element(:id, "detallista.seller.alternatePartyIdentification.value").send_keys "TES"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "additionalInformation.referenceIdentificationInternal.type1")).select_by(:text, "Folio de recibo de mercancias")
    @driver.find_element(:id, "orderIdentification.referenceIdentification1").clear
    @driver.find_element(:id, "orderIdentification.referenceIdentification1").send_keys "1"
    @driver.find_element(:id, "additionalInformation.referenceIdentificationInternal.value1").clear
    @driver.find_element(:id, "additionalInformation.referenceIdentificationInternal.value1").send_keys "123456"
    @driver.find_element(:name, "deliveryNote.referenceIdentification1").clear
    @driver.find_element(:name, "deliveryNote.referenceIdentification1").send_keys "1"
    @driver.find_element(:xpath, '//*[@id="remision"]/table/tbody/tr[6]/td/table/tbody/tr[2]/td/table/tbody/tr[29]/td/table/tbody/tr[8]/td[2]/input[2]').click
    #@driver.find_element(:id, "addConcepto").click
    @driver.find_element(:xpath, "//table[@id='tablaConceptos']/tbody/tr[3]/td[7]/img").click
    @driver.find_element(:id, "lineItem.tradeItemIdentification.gtin").clear
    @driver.find_element(:id, "lineItem.tradeItemIdentification.gtin").send_keys "1234"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "lineItem.alternateTradeItemIdentifications[0].type")).select_by(:text, "Asignado por el Comprador")
    @driver.find_element(:id, "concepto.descripcion").clear
    @driver.find_element(:id, "concepto.descripcion").send_keys "Prueba Producto"
    @driver.find_element(:id, "concepto.cantidad").clear
    @driver.find_element(:id, "concepto.cantidad").send_keys "1"
    @driver.find_element(:id, "concepto.valorUnitario").clear
    @driver.find_element(:id, "concepto.valorUnitario").send_keys "10.00"
    #@driver.find_element(:id, "importe").clear
    #@driver.find_element(:id, "importe").send_keys "10.00"
    @driver.find_element(:id, "lineItem.logisticUnits.serialShippingContainerCode.value").clear
    @driver.find_element(:id, "lineItem.logisticUnits.serialShippingContainerCode.value").send_keys "1234"
    @driver.find_element(:id, "guardarConcepto").click
    @driver.switch_to.alert.accept
    @driver.find_element(:id, "btnSaveLow").click
    @driver.switch_to.alert.accept
    verify { (@driver.find_element(:xpath, "//table[@class='contorno']/tbody/tr[2]/td[2]/p").text).should == "La Remisión Electrónica ha sido almacenada en su buzón." }
  end
  
end
