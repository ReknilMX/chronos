# encoding: utf-8

require "buzon_fiscal_gratuito_spec_helper"

describe "WB.BF.GR.P.CapRem Cliente Nuevo", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Captura Remisión").click
    @driver.radio(:value => "nuevo").click
    @driver.select_list(:id => "comboSucursales").select "Principal"
    @driver.select_list(:id => "tipCFD").select "Factura"
    @driver.select_list(:id => "lstRegimen").select "Regimen Fiscal General"
    @driver.text_field(:id => "clienteModel.nombre").set "Pruebas Buzon Fiscal Diverza"
    @driver.text_field(:id => "clienteModel.rfc").set "TEST010101TST"
    @driver.text_field(:id => "clienteModel.domicilio.calle").set "Paseo de la Reforma"
    @driver.text_field(:id => "clienteModel.domicilio.noExterior").set "105"
    @driver.text_field(:id => "clienteModel.domicilio.noInterior").set "502"
    @driver.text_field(:id => "clienteModel.domicilio.referencia").set "Sevilla Palace"
    @driver.text_field(:id => "clienteModel.domicilio.colonia").set "Tabacalera"
    @driver.text_field(:id => "clienteModel.domicilio.codigoPostal").set "03060"
    @driver.text_field(:id => "clienteModel.domicilio.localidad").set "Cuauhtémoc"
    @driver.text_field(:id => "clienteModel.domicilio.municipio").set "Cuauhtémoc"
    @driver.text_field(:id => "clienteModel.domicilio.estado").set "Distrito Federal"
    @driver.text_field(:id => "clienteModel.domicilio.pais").set "México"
    @driver.select_list(:id => "formapgo").select "Pago en una sola exhibición"
    @driver.text_field(:id => "remision.infoAdicional.condicionesDePago").set "Prueba de Pago"
    @driver.select_list(:id => "lstmetodoDePago").select "Efectivo"
    @driver.checkbox(:name => "impuestosTrasladados").set
    @driver.link(:text => "++ Agregar un Concepto ++").click
    @driver.text_field(:id => "noIdentificacion").set "1"
    @driver.text_field(:id => "cantidad").set "1"
    @driver.text_field(:id => "medida").set "1"
    @driver.text_field(:id => "descripcion").set "Prueba Producto"
    @driver.text_field(:id => "unitario").set "10.00"
    @driver.text_field(:id => "importe").set "10.00"
    @driver.element(:id => "guardarConcepto").click
    @driver.alert.ok
    @driver.element(:id => "calcular").click
	@driver.element(:id => "btnSave").click
	@driver.text.include?("La Remisión Electrónica ha sido almacenada en su buzón.").should == true
  end

end

describe "WB.BF.GR.P.CapRem Cliente Existente", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Captura Remisión").click
    @driver.text_field(:id => "value").set "TEST"
    @driver.element(:name => "busqueda").click
    @driver.radio(:name => "idCliente").click
    @driver.element(:xpath => '//*[@id="boton"]/input').click
    @driver.select_list(:id => "comboSucursales").select "Principal"
    @driver.select_list(:id => "tipCFD").select "Factura"
    @driver.select_list(:id => "lstRegimen").select "Regimen Fiscal General"
    @driver.text_field(:id => "clienteModel.nombre").set "Pruebas Buzon Fiscal Diverza"
    @driver.text_field(:id => "clienteModel.rfc").set "TEST010101TST"
    @driver.text_field(:id => "clienteModel.domicilio.calle").set "Paseo de la Reforma"
    @driver.text_field(:id => "clienteModel.domicilio.noExterior").set "105"
    @driver.text_field(:id => "clienteModel.domicilio.noInterior").set "502"
    @driver.text_field(:id => "clienteModel.domicilio.referencia").set "Sevilla Palace"
    @driver.text_field(:id => "clienteModel.domicilio.colonia").set "Tabacalera"
    @driver.text_field(:id => "clienteModel.domicilio.codigoPostal").set "03060"
    @driver.text_field(:id => "clienteModel.domicilio.localidad").set "Cuauhtémoc"
    @driver.text_field(:id => "clienteModel.domicilio.municipio").set "Cuauhtémoc"
    @driver.text_field(:id => "clienteModel.domicilio.estado").set "Distrito Federal"
    @driver.text_field(:id => "clienteModel.domicilio.pais").set "México"
    @driver.select_list(:id => "formapgo").select "Pago en una sola exhibición"
    @driver.text_field(:id => "remision.infoAdicional.condicionesDePago").set "Prueba de Pago"
    @driver.select_list(:id => "lstmetodoDePago").select "Efectivo"
    @driver.checkbox(:name => "impuestosTrasladados").set
    @driver.link(:text => "++ Agregar un Concepto ++").click
    @driver.text_field(:id => "noIdentificacion").set "1"
    @driver.text_field(:id => "cantidad").set "1"
    @driver.text_field(:id => "medida").set "1"
    @driver.text_field(:id => "descripcion").set "Prueba Producto"
    @driver.text_field(:id => "unitario").set "10.00"
    @driver.text_field(:id => "importe").set "10.00"
    @driver.element(:id => "guardarConcepto").click
    @driver.alert.ok
    @driver.element(:id => "calcular").click
	@driver.element(:id => "btnSave").click
	@driver.text.include?("La Remisión Electrónica ha sido almacenada en su buzón.").should == true
  end

end
