require "design_spec_helper"

describe "WB.BF.P.Captura Nuevo Cliente", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do

    #Login
    @driver.goto("https://q-amber.diverza.com/login.jsp")
    @driver.text_field(:name => 'j_rfc').set "DFAC010101BBX"
    @driver.text_field(:name => 'j_username').set "diego.agudelo@diverza.com"
    @driver.text_field(:name => 'j_password').set "QAadministra2*"
    @driver.button(:id => 'btnSubmit').click

    #Captura
    @driver.element(:text => "Captura").click
    @driver.element(:xpath => "//table[@class='contorno']/tbody/tr[2]/td/input").click
    @driver.element(:xpath => "//td[@class='repdatos']/input[1]").click
    @driver.select_list(:id => "tipCFD").select "Factura"
    @driver.text_field(:id => "lexpedicion").set "Domicilio Privado para efecto de pruebas"
    @driver.text_field(:id => "receptorRfc").set "TEST010101TST"
    @driver.text_field(:id => "clienteModel.nombre").set "Pruebas Buzon Fiscal Diverza"
    @driver.text_field(:id => "clienteModel.domicilio.calle").set "Prueba"
    @driver.text_field(:id => "clienteModel.domicilio.municipio").set "Prueba"
    @driver.text_field(:id => "clienteModel.domicilio.estado").set "Prueba"
    @driver.text_field(:id => "clienteModel.domicilio.pais").set "Prueba"
    @driver.text_field(:id => "clienteModel.domicilio.codigoPostal").set "07300"
    @driver.select_list(:id => "lstmetodoDePago").select "Efectivo"
    @driver.select_list(:id => "addendaCommand.CFD.tipoMoneda").select "Pesos"
    @driver.element(:css => "option[value=\"MXN\"]").click
    @driver.element(:name => "impuestosTrasladados").click
    @driver.element(:xpath => "//table[@id='tablaConceptos']/tbody/tr[3]/td[7]/a/img").click
    @driver.text_field(:id => "noIdentificacion").set "1"
    @driver.text_field(:id => "cantidad").set "1"
    @driver.text_field(:id => "medida").set "1"
    @driver.text_field(:id => "descripcion").set "Prueba Diverza"
    @driver.text_field(:id => "unitario").set "10.00"
    @driver.text_field(:id => "importe").set "10.00"
    @driver.element(:id, "guardarConcepto").click
    @driver.alert.ok
    @driver.element(:id, "btnSaveLow").click
    @driver.alert.ok
    assert @driver.element(:xpath => "//table[@class='contorno']/tbody/tr[2]/td[2]/p").text.include? 'La Remisión Electrónica ha sido almacenada en su buzón.'
    #@driver.element(:link => "Emisión").click
    #@driver.select_list(:name => "tipoDocumento").select "Factura"
    #@driver.element(:css => "input[type=\"image\"]").click
    #@driver.element(:id => "checkboxes.id").click
    #@driver.select_list(:xpath => "//table[@id='remision']/tbody/tr[1]/td[5]/select").select "A"
    #@driver.element(:id => "expedir").click
    #assert @driver.element(:css => "p.mensaje").text.include? 'Los Comprobantes Fiscales Digitales han sido expedidos y almacenados en su buzón.'    
  end
  
end
