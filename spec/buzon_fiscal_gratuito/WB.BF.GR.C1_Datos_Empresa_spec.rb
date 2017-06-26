# encoding: utf-8

require "buzon_fiscal_gratuito_spec_helper"

describe "WB.BF.GR.C.DatEmp Editar", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Datos Empresa").click
    @driver.img(:alt => "Editar esta información").click
    @driver.text_field(:name => "domicilioFiscal.calle").set "Doctor José María Coss"
    @driver.text_field(:name => "domicilioFiscal.noExterior").set "731"
    @driver.text_field(:name => "domicilioFiscal.noInterior").set "Piso 9"
    @driver.text_field(:name => "domicilioFiscal.referencia").set "Torre Meridiano"
    @driver.text_field(:name => "domicilioFiscal.colonia").set "Centro"
    @driver.text_field(:name => "domicilioFiscal.localidad").set "Monterrey"
    @driver.text_field(:name => "domicilioFiscal.municipio").set "Monterrey"
    @driver.text_field(:name => "domicilioFiscal.estado").set "Nuevo León"
    @driver.select_list(:name => "domicilioFiscal.pais").select "México"
    @driver.text_field(:name => "telefono").set "40001500"
    @driver.text_field(:name => "emailComercial").set "mario.gutierrez@diverza.com"
    @driver.text_field(:name => "regimenFiscales").set "Regimen Fiscal General"
    @driver.img(:src => "/images/personal/btn-guardar.png").click
    @driver.element(:name => "_finish").click
  end

end

