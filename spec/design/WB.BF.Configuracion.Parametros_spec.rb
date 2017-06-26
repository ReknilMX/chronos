# encoding: utf-8

require "buzon_fiscal_spec_helper"

describe "WB.BF.C.Par.Impuestos Alta Local", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.element(:name => "config").click
    @driver.element(:text => "Impuestos").click
    @driver.element(:css, "input[type=\"image\"]").click
    @driver.select_list(:name, "tipoImpuesto").select "Local"
    @driver.select_list(:name, "tipoDocumento").select "Factura"
    @driver.select_list(:id, "categoria").select "Retenido"
    @driver.text_field(:name, "tasa").set "3.00"
    @driver.text_field(:id, "impuesto").set "Municipal"
    @driver.element(:css, "input[type=\"image\"]").click

  end
  
end
