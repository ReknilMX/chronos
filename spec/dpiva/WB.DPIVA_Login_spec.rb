# encoding: utf-8

require "dpivaspec_helper"

describe "WB.DPIVA Login DPIVA Cliente CE + PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => 'DPIVA').click
    @driver.file_field(:id => 'fiel_fiel_key_file').set(Rails.root.join "spec/dpiva/resources/AAA010101AAA_FIEL.key")
    @driver.text_field(:id => 'fiel_fiel_private_key').set "12345678a"
    @driver.link(:id => 'fiel-login-button').click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    @driver.div(text: 'Bienvenido a DPIVA').should exist
    @driver.span(text: /(FIEL)/).should exist
  end

end

describe "WB.DPIVA Login DPIVA Contador CE + PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => 'DPIVA').click
    @driver.file_field(:id => 'fiel_fiel_key_file').set(Rails.root.join "spec/dpiva/resources/AAA010101AAA_FIEL.key")
    @driver.text_field(:id => 'fiel_fiel_private_key').set "12345678a"
    @driver.link(:id => 'fiel-login-button').click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    @driver.div(text: 'Bienvenido a DPIVA').should exist
    @driver.span(text: /(FIEL)/).should exist
  end

end

describe "WB.DPIVA Login DPIVA Financiero CE + PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_financiero_CEPR"

  it Time.now do
    @driver.link(:text => 'DPIVA').click
    @driver.file_field(:id => 'fiel_fiel_key_file').set(Rails.root.join "spec/dpiva/resources/AAA010101AAA_FIEL.key")
    @driver.text_field(:id => 'fiel_fiel_private_key').set "12345678a"
    @driver.link(:id => 'fiel-login-button').click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    @driver.div(text: 'Bienvenido a DPIVA').should exist
    @driver.span(text: /(FIEL)/).should exist
  end

end
