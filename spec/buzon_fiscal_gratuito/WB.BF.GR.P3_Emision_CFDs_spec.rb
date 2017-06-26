# encoding: utf-8

require "buzon_fiscal_gratuito_spec_helper"

describe "WB.BF.GR.P.EmiCFD Busqueda general", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Emisión CFDs").click
    @driver.select_list(:name => "idExpedidoEn").select "Principal"
    @driver.select_list(:name => "tipoDocumento").select "Factura"
    @driver.element(:xpath => '/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[5]/td/input').click
    @driver.text.include?("Resultados.").should == true
  end

end

describe "WB.BF.GR.P.EmiCFD Busqueda por Nombre", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Emisión CFDs").click
    @driver.select_list(:name => "idExpedidoEn").select "Principal"
    @driver.select_list(:name => "tipoDocumento").select "Factura"
    @driver.element(:xpath => '/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[5]/td/input').click
    @driver.text_field(:id => "razonSocial").set "Pruebas Buzon Fiscal Diverza"
    @driver.element(:name => "busqueda").click
    @driver.text.include?("Resultados.").should == true
  end

end

describe "WB.BF.GR.P.EmiCFD Busqueda por Monto Total", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Emisión CFDs").click
    @driver.select_list(:name => "idExpedidoEn").select "Principal"
    @driver.select_list(:name => "tipoDocumento").select "Factura"
    @driver.element(:xpath => '/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[5]/td/input').click
    @driver.text_field(:id => "monto").set "11.60"
    @driver.element(:name => "busqueda").click
    @driver.text.include?("Resultados.").should == true
  end

end

describe "WB.BF.GR.P.EmiCFD Busqueda por Fechas", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Emisión CFDs").click
    @driver.select_list(:name => "idExpedidoEn").select "Principal"
    @driver.select_list(:name => "tipoDocumento").select "Factura"
    @driver.element(:xpath => '/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[5]/td/input').click
    @driver.text_field(:id => "campo1").set "01/01/2014"
    @driver.text_field(:id => "campo2").set "31/12/2018"
    @driver.element(:name => "busqueda").click
    @driver.text.include?("Resultados.").should == true
  end

end

describe "WB.BF.GR.P.EmiCFD Expedir sin seleccionar", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Emisión CFDs").click
    @driver.select_list(:name => "idExpedidoEn").select "Principal"
    @driver.select_list(:name => "tipoDocumento").select "Factura"
    @driver.element(:xpath => '/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[5]/td/input').click
    @driver.element(:id => "expedir").click
    @driver.alert.ok
  end

end

describe "WB.BF.GR.P.EmiCFD Expedir uno", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Emisión CFDs").click
    @driver.select_list(:name => "idExpedidoEn").select "Principal"
    @driver.select_list(:name => "tipoDocumento").select "Factura"
    @driver.element(:xpath => '/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[5]/td/input').click
    @driver.checkbox(:name => "checkboxes.id").set
    @driver.element(:id => "expedir").click
    @driver.text.include?("Los Comprobantes Fiscales Digitales han sido expedidos y almacenados en su buzón.").should == true
  end

end

describe "WB.BF.GR.P.EmiCFD Expedir todos", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Emisión CFDs").click
    @driver.select_list(:name => "idExpedidoEn").select "Principal"
    @driver.select_list(:name => "tipoDocumento").select "Factura"
    @driver.element(:xpath => '/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/form/table/tbody/tr[5]/td/input').click
    @driver.checkbox(:name => "todos").set
    @driver.element(:id => "expedir").click
    @driver.text.include?("Los Comprobantes Fiscales Digitales han sido expedidos y almacenados en su buzón.").should == true
  end

end