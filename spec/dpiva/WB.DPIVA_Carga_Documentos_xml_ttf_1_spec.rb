# encoding: utf-8

require "dpivaspec_helper"

describe "WB.DPIVA - C11239 - DPIVA - Validar que si el documento digital no esta referenciado al namespace de acuerdo a lo especificado muestre un mensaje de error", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_dpiva_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "DPIVA").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'dpiva_form_file').set(Rails.root.join "spec/dpiva/resources/dpiva/dpiva_C11239.xml")
    @driver.element(:name => "commit").click
    @driver.element(:id => 'flash-alert').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Se ha creado el documento DPIVA"
    @driver.link(:text => "Enviar al SAT").click
    @driver.link(:text => "Aceptar").click
    @driver.element(:id => 'flash-alert').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Ocurrió un error en el proceso de envío, intenta más tarde."
  end

end