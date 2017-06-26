# encoding: utf-8

require "buzon_fiscal_gratuito_spec_helper"

describe "WB.BF.GR.P.ArcCFD Busqueda por RFC", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo CFDs").click
    @driver.select_list(:id => "search.criteria").select "RFC"
    @driver.text_field(:name => "search.value").set "TEST010101TST"
    @driver.element(:name => "_target1").click
    @driver.text.include?("Resultados.").should == true
  end

end

describe "WB.BF.GR.P.ArcCFD Busqueda por Cliente", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo CFDs").click
    @driver.select_list(:id => "search.criteria").select "Cliente"
    @driver.text_field(:name => "search.value").set "Pruebas Buzon Fiscal Diverza"
    @driver.element(:name => "_target1").click
    @driver.text.include?("Resultados.").should == true
  end

end

describe "WB.BF.GR.P.ArcCFD Busqueda por Folio", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo CFDs").click
    @driver.select_list(:id => "search.criteria").select "Cliente"
    @driver.text_field(:id => "search.value").set "1"
    @driver.element(:name => "_target1").click
    if @driver.text.include?("1 Resultado encontrado.").should == true
    elsif @driver.text.include?("Resultados.").should == true
    end
  end

end

describe "WB.BF.GR.P.ArcCFD Descargar 1", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo CFDs").click
    @driver.select_list(:id => "search.criteria").select "Cliente"
    @driver.text_field(:name => "search.value").set "1"
    @driver.checkbox(:name => "checkboxes.id").set
    @driver.element(:name => "_target2").click
    @driver.element(:name => "_cancel").should exist
    @driver.element(:name => "_target3").should exist
    @driver.element(:name => "_target3").click
  end

end

describe "WB.BF.GR.P.ArcCFD Descargar todos", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo CFDs").click
    @driver.checkbox(:name => "todos").set
    @driver.element(:name => "_target2").click
    @driver.element(:name => "_target3").click
  end

end

describe "WB.BF.GR.P.ArcCFD Enviar 1", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo CFDs").click
    @driver.checkbox(:name => "checkboxes.id").set
    @driver.element(:name => "_target6").click
    @driver.text_field(:name => "checkboxes.email").set "mario.gutierrez@diverza.com"
    @driver.element(:name => "_target7").click
    @driver.text.include?("Se ha efectuado con éxito el envío del o los comprobante(s) seleccionado(s). Recibirá una notificación cuando el documento haya sido descargado por el receptor.").should == true
  end

end

describe "WB.BF.GR.P.ArcCFD Enviar todos", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo CFDs").click
    @driver.checkbox(:name => "todos").set
    @driver.element(:name => "_target6").click
    @driver.text_field(:name => "checkboxes.email").set "mario.gutierrez@diverza.com"
    @driver.element(:name => "_target7").click
    @driver.text.include?("Se ha efectuado con éxito el envío del o los comprobante(s) seleccionado(s). Recibirá una notificación cuando el documento haya sido descargado por el receptor.").should == true
  end

end

describe "WB.BF.GR.P.ArcCFD Cancelar 1", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo CFDs").click
    @driver.checkbox(:name => "checkboxes.id").set
    @driver.element(:name => "_target4").click
    @driver.element(:name => "_target5").click
    @driver.text.include?("Se ha efectuado con éxito la cancelación del o los comprobante(s) seleccionado(s).").should == true
  end

end
=begin
describe "WB.BF.GR.P.ArcCFD Cancelar todos", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo CFDs").click
    @driver.checkbox(:name => "todos").set
    @driver.element(:name => "_target4").click
    @driver.element(:name => "_target5").click
    @driver.text.include?("Se ha efectuado con éxito el envío del o los comprobante(s) seleccionado(s). Recibirá una notificación cuando el documento haya sido descargado por el receptor.").should == true
  end

end
=end