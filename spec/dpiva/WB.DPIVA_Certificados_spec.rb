# encoding: utf-8

require "dpivaspec_helper"

describe "WB.DPIVA Carga de Certificados", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => 'DPIVA').click
    if @driver.file_field(:id => 'fiel_cer_file').exists?
      @driver.file_field(:id => 'fiel_cer_file').set(Rails.root.join "spec/dpiva/resources/CSD01_AAA010101AAA.cer")
      @driver.file_field(:id => 'fiel_key_file').set(Rails.root.join "spec/dpiva/resources/CSD01_AAA010101AAA.key")
      @driver.text_field(:id => 'fiel_private_key').set "12345678a"
      @driver.file_field(:id => 'fiel_fiel_cer_file').set(Rails.root.join "spec/dpiva/resources/AAA010101AAA_FIEL.cer")
      @driver.file_field(:id => 'fiel_fiel_key_file').set(Rails.root.join "spec/dpiva/resources/AAA010101AAA_FIEL.key")
      @driver.text_field(:id => 'fiel_fiel_private_key').set "12345678a"
      @driver.link(:id => 'fiel-button').click
      @driver.div(:class => 'alert alert-info text-left').wait_until_present
      @driver.div(text: 'Bienvenido a DPIVA').should exist
    elsif @driver.file_field(:id => 'fiel_fiel_cer_file').exists?
      @driver.file_field(:id => 'fiel_fiel_cer_file').set(Rails.root.join "spec/dpiva/resources/AAA010101AAA_FIEL.cer")
      @driver.file_field(:id => 'fiel_fiel_key_file').set(Rails.root.join "spec/dpiva/resources/AAA010101AAA_FIEL.key")
      @driver.text_field(:id => 'fiel_fiel_private_key').set "12345678a"
      @driver.link(:id => 'fiel-button').click
      @driver.div(:class => 'alert alert-info text-left').wait_until_present
      @driver.div(text: 'Bienvenido a DPIVA').should exist
    else
      @driver.file_field(:id => 'fiel_fiel_key_file').set(Rails.root.join "spec/dpiva/resources/AAA010101AAA_FIEL.key")
      @driver.text_field(:id => 'fiel_fiel_private_key').set "12345678a"
      @driver.link(:id => 'fiel-login-button').click
      @driver.div(:class => 'alert alert-info text-left').wait_until_present
      @driver.div(text: 'Bienvenido a DPIVA').should exist
      @driver.span(text: /(FIEL)/).should exist
    end
  end

end
