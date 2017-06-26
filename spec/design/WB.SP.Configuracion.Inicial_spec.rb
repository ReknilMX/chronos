# encoding: utf-8

require "design_spec_helper"

describe "WB.SP.C.Inicial", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do

    @driver.goto "https://q-grey.diverza.com/"
    @driver.text_field(:name => 'j_rfc').set "VAHE8209266A1"
    @driver.text_field(:name => 'j_username').set "mario.gutierrez@diverza.com"
    @driver.text_field(:name => 'j_password').set "QAadministra2*"
    @driver.button(:id => 'btnSubmit').click

    @driver.element(:name => "config").click
    
    @driver.element(:text => "Datos Generales").click
    @driver.element(:xpath => "/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr[1]/td/table/tbody/tr[2]/td/table/tbody/tr/td/a[1]/img").click
    @driver.element(:id => "agregaRegimenFiscalButton").click
    @driver.text_field(:name => "regimenFiscales").set "Regimen de Empresas"
    @driver.element(:name => "_target1").click
    @driver.element(:name => "_finish").click
    
    @driver.element(:text => "Sucursales").click
    @driver.element(:xpath => "/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[3]/td/table/tbody/tr[4]/td/input").click
    @driver.text_field(:name => "nombre").set "Principal"
    @driver.text_field(:name => "alias").set "Monterrey"
    @driver.text_field(:name => "ubicacion.calle").set "Doctor José María Coss"
    @driver.text_field(:name => "ubicacion.noExterior").set "731"
    @driver.text_field(:name => "ubicacion.noInterior").set "Piso 9"
    @driver.text_field(:name => "ubicacion.referencia").set "Torre Meridiano"
    @driver.text_field(:name => "ubicacion.colonia").set "Centro"
    @driver.text_field(:name => "ubicacion.localidad").set "Monterrey"
    @driver.text_field(:name => "ubicacion.municipio").set "Monterrey"
    @driver.text_field(:name => "ubicacion.codigoPostal").set "64000"
    @driver.text_field(:name => "ubicacion.estado").set "Nuevo León"
    @driver.select_list(:name => "ubicacion.pais").select "México"
    @driver.text_field(:name => "telefono").set "40001500"
    @driver.element(:xpath => "/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[4]/td/table/tbody/tr/td/input").click

    
    @driver.element(:text => "Certificados").click
    @driver.element(:xpath => "/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[2]/td/table/tbody/tr[5]/td/a/img").click
    @driver.file_field(:name => "certificado").set(Rails.root.join "spec/design/resources/CSD01_AAA010101AAA.cer")
    @driver.file_field(:name => "clavePrivada").set(Rails.root.join "spec/design/resources/CSD01_AAA010101AAA.key")
    @driver.text_field(:name => "password").set "12345678a"
    @driver.element(:name => "_target1").click
    @driver.element(:name => "_finish").click

    @driver.element(:text => "CFD's Aplicables").click
    @driver.checkbox(:name => "todos").set
    @driver.element(:name => "instalar").click

    @driver.element(:text => "Habilitación").click
    @driver.select_list(:name => "tipoDocumento").select "Factura"
    @driver.text_field(:name => "serie").set "A"
    @driver.text_field(:name => "folioInferior").set "1"
    @driver.element(:name => "habilitar").click
    @driver.element(:name => "botonForma").click

    @driver.element(:text => "Impuestos").click
    @driver.element(:xpath => "/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[4]/td/input").click
    @driver.select_list(:name, "tipoImpuesto").select "Federal"
    @driver.select_list(:name, "tipoDocumento").select "Factura"
    @driver.select_list(:id, "categoria").select "Trasladado"
    @driver.text_field(:name, "tasa").set "16.00"
    @driver.select_list(:id, "impuesto").select "IVA"
    @driver.element(:xpath => "/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[4]/td/input").click
    @driver.element(:xpath => "/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[4]/td/input").click
    @driver.select_list(:name, "tipoImpuesto").select "Federal"
    @driver.select_list(:name, "tipoDocumento").select "Factura"
    @driver.select_list(:id, "categoria").select "Retenido"
    @driver.text_field(:name, "tasa").set "30.00"
    @driver.select_list(:id, "impuesto").select "ISR"
    @driver.element(:xpath => "/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[4]/td/input").click
    @driver.element(:xpath => "/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[4]/td/input").click
    @driver.select_list(:name, "tipoImpuesto").select "Local"
    @driver.select_list(:name, "tipoDocumento").select "Factura"
    @driver.select_list(:id, "categoria").select "Retenido"
    @driver.text_field(:name, "tasa").set "3.00"
    @driver.text_field(:id, "impuesto").set "Municipal"
    @driver.element(:xpath => "/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[4]/td/input").click

  end
  
end
