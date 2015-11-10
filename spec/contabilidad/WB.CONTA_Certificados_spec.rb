# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA Cargar Certificado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Certificados").click
    @driver.link(:class => "btn btn-primary pull-right").click
    @driver.file_field(:id => 'certificate_key_file').set(Rails.root.join "spec/contabilidad/resources/CSD01_AAA010101AAA.key")
    @driver.file_field(:id => 'certificate_cer_file').set(Rails.root.join "spec/contabilidad/resources/CSD01_AAA010101AAA.cer")
    @driver.text_field(:id => 'certificate_private_key').set "12345678a"
    @driver.button(:name => 'button').click
    if @driver.text.include?("Ya existe un Certificado con el Número de Serie: 20001000000200001428").should == true
      @driver.link(:text => "Certificados").click
      @driver.text.include?("20001000000200001428").should == true
    else
      @driver.text.include?("El certificado se ha agregado con éxito.").should == true
    end
  end

end

describe "WB.CONTA Certificado no registrado en LCO", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Certificados").click
    @driver.link(:class => "btn btn-primary pull-right").click
    @driver.file_field(:id => 'certificate_key_file').set(Rails.root.join "spec/contabilidad/resources/CSD02_AAA010101AAA.key")
    @driver.file_field(:id => 'certificate_cer_file').set(Rails.root.join "spec/contabilidad/resources/CSD02_AAA010101AAA.cer")
    @driver.text_field(:id => 'certificate_private_key').set "12345678a"
    @driver.button(:name => 'button').click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    @driver.text.include?("El Certificado de Sello Digital con Número de Serie 20001000000200001429 no existe en la LCO").should == true
  end

end

describe "WB.CONTA Archivo sin Certificado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Certificados").click
    @driver.link(:class => "btn btn-primary pull-right").click
    @driver.file_field(:id => 'certificate_key_file').set(Rails.root.join "spec/contabilidad/resources/AAA010101AAA_FIEL.key")
    @driver.file_field(:id => 'certificate_cer_file').set(Rails.root.join "spec/contabilidad/resources/AAA010101AAA_FIEL.cer")
    @driver.text_field(:id => 'certificate_private_key').set "12345678a"
    @driver.button(:name => 'button').click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    @driver.text.include?("El archivo no contiene un Certificado de Sello Digital").should == true
  end

end

describe "WB.CONTA Certificado invalido", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Certificados").click
    @driver.link(:class => "btn btn-primary pull-right").click
    @driver.file_field(:id => 'certificate_key_file').set(Rails.root.join "spec/contabilidad/resources/CSDINV_AAA010101AAA.key")
    @driver.file_field(:id => 'certificate_cer_file').set(Rails.root.join "spec/contabilidad/resources/CSDINV_AAA010101AAA.cer")
    @driver.text_field(:id => 'certificate_private_key').set "12345678a"
    @driver.button(:name => 'button').click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    @driver.text.include?("El Certificado de Sello Digital no fue emitido por una Entidad Certificadora Autorizada").should == true
  end

end

describe "WB.CONTA Certificado clave incorrecta", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Certificados").click
    @driver.link(:class => "btn btn-primary pull-right").click
    @driver.file_field(:id => 'certificate_key_file').set(Rails.root.join "spec/contabilidad/resources/CSD01_AAA010101AAA.key")
    @driver.file_field(:id => 'certificate_cer_file').set(Rails.root.join "spec/contabilidad/resources/CSD01_AAA010101AAA.cer")
    @driver.text_field(:id => 'certificate_private_key').set "12345678"
    @driver.button(:name => 'button').click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    @driver.text.include?("El archivo .key es invalido o la clave de acceso es incorrecta").should == true
  end

end
