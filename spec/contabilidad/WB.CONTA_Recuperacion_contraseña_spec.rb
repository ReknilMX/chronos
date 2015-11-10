# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA Recuperación de contraseña", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"

  it Time.now do
    @driver.goto @base_url
    @driver.link(:text => "¿Olvidaste tu contraseña o usuario?").click
    @driver.text_field(:id => 'sso_mail').set "mario.gutierrez@diverza.com"
    @driver.button(:name => 'commit').click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    @driver.div(text: 'Se ha enviado un correo con las instrucciones para reiniciar la contraseña.').should exist
  end

end

describe "WB.CONTA Recuperación de contraseña correo invalido", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"

  it Time.now do
    @driver.goto @base_url
    @driver.link(:text => "¿Olvidaste tu contraseña o usuario?").click
    @driver.text_field(:id => 'sso_mail').set "mario.gutierrez"
    @driver.button(:name => 'commit').click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    @driver.div(text: 'Correo electrónico ingresado no es válido, favor de verificar e intentar de nuevo').should exist
  end

end

describe "WB.CONTA Recuperación de contraseña correo inexistente", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"

  it Time.now do
    @driver.goto @base_url
    @driver.link(:text => "¿Olvidaste tu contraseña o usuario?").click
    @driver.text_field(:id => 'sso_mail').set "mail@diverza.com"
    @driver.button(:name => 'commit').click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    @driver.div(text: 'No se ha encontrado el correo electrónico').should exist
  end

end

describe "WB.CONTA Recuperación de contraseña correo vacio", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"

  it Time.now do
    @driver.goto @base_url
    @driver.link(:text => "¿Olvidaste tu contraseña o usuario?").click
    @driver.button(:name => 'commit').click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    @driver.div(text: 'El campo de correo electrónico no puede estar vacío').should exist
  end

end