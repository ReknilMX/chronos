# encoding: utf-8

require "buzon_fiscal_gratuito_spec_helper"

describe "WB.BF.GR.P.ArcRem Busqueda por RFC", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo Remisiones").click
    @driver.select_list(:id => "search.criteria").select "RFC"
    @driver.text_field(:id => "value").set "TEST010101TST"
    @driver.element(:name => "busqueda").click
    @driver.text.include?("Resultados.").should == true
  end

end

describe "WB.BF.GR.P.ArcRem Busqueda por Cliente", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo Remisiones").click
    @driver.select_list(:id => "search.criteria").select "Cliente"
    @driver.text_field(:id => "value").set "Pruebas Buzon Fiscal Diverza"
    @driver.element(:name => "busqueda").click
    @driver.text.include?("Resultados.").should == true
  end

end

describe "WB.BF.GR.P.ArcRem Editar Remisión", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo Remisiones").click
    @driver.select_list(:id => "search.criteria").select "Cliente"
    @driver.text_field(:id => "value").set "Pruebas Buzon Fiscal Diverza"
    @driver.element(:name => "busqueda").click
    @driver.img(:alt => 'Editar Remisión').click
    @driver.element(:id => "btnSave").should exist
    @driver.element(:xpath => '//*[@id="boton"]/table/tbody/tr/td/a/img').should exist
    @driver.text_field(:id => "remision.receptor.nombre").set "Pruebas Buzon Fiscal Diverza Editado"
    @driver.element(:id => "btnSave").click
    @driver.text.include?("La Remisión Electrónica ha sido almacenada en su buzón.").should == true
    @driver.link(:text => "Archivo Remisiones").click
    @driver.element(:xpath => '//*[@id="remision"]/tbody/tr[1]/td[2]/a').text.include?("Pruebas Buzon Fiscal Diverza Editado").should == true
  end

end

describe "WB.BF.GR.P.ArcRem Ver Remisión", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo Remisiones").click
    @driver.select_list(:id => "search.criteria").select "Cliente"
    @driver.text_field(:id => "value").set "Pruebas Buzon Fiscal Diverza"
    @driver.element(:name => "busqueda").click
    @driver.element(:xpath => '//*[@id="remision"]/tbody/tr[1]/td[8]/a/img').click
    @driver.windows.last.use do
        @driver.frame(:name => "toolbar").element(:xpath => '/html/body/table/tbody/tr/td/table/tbody/tr[1]/td/img').should exist
        @driver.frame(:name => "toolbar").element(:xpath => '/html/body/table/tbody/tr/td/table/tbody/tr[2]/td/a[1]/img').should exist
        @driver.frame(:name => "toolbar").element(:xpath => '/html/body/table/tbody/tr/td/table/tbody/tr[2]/td/a[2]/img').should exist
        @driver.frame(:name => "toolbar").element(:xpath => '/html/body/table/tbody/tr/td/table/tbody/tr[2]/td/a[3]/img').should exist
        @driver.frame(:name => "cfd").element(:xpath => '/html/body/table/tbody/tr/td/table/tbody/tr[5]/td/span/span').should exist
    end
  end

end

describe "WB.BF.GR.P.ArcRem Ver Remisión Imprimir", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo Remisiones").click
    @driver.select_list(:id => "search.criteria").select "Cliente"
    @driver.text_field(:id => "value").set "Pruebas Buzon Fiscal Diverza"
    @driver.element(:name => "busqueda").click
    @driver.element(:xpath => '//*[@id="remision"]/tbody/tr[1]/td[8]/a/img').click
    @driver.windows.last.use do
        @driver.frame(:name => "toolbar").element(:xpath => '/html/body/table/tbody/tr/td/table/tbody/tr[2]/td/a[1]/img').should exist
    end
  end

end

describe "WB.BF.GR.P.ArcRem Ver Remisión descargar PDF", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo Remisiones").click
    @driver.select_list(:id => "search.criteria").select "Cliente"
    @driver.text_field(:id => "value").set "Pruebas Buzon Fiscal Diverza"
    @driver.element(:name => "busqueda").click
    @driver.element(:xpath => '//*[@id="remision"]/tbody/tr[1]/td[8]/a/img').click
    @driver.windows.last.use do
        @driver.frame(:name => "toolbar").element(:xpath => '/html/body/table/tbody/tr/td/table/tbody/tr[2]/td/a[2]/img').click
    end
  end

end

describe "WB.BF.GR.P.ArcRem Ver Remisión descargar XML", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Archivo Remisiones").click
    @driver.select_list(:id => "search.criteria").select "Cliente"
    @driver.text_field(:id => "value").set "Pruebas Buzon Fiscal Diverza"
    @driver.element(:name => "busqueda").click
    @driver.element(:xpath => '//*[@id="remision"]/tbody/tr[1]/td[8]/a/img').click
    @driver.windows.last.use do
        @driver.frame(:name => "toolbar").element(:xpath => '/html/body/table/tbody/tr/td/table/tbody/tr[2]/td/a[3]/img').click
    end
  end

end