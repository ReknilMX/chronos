# encoding: utf-8

require "buzon_fiscal_spec_helper"

describe "WB.BF Login Datos vacios", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto(@base_url + "/login.jsp")
    @driver.button(:id => 'btnSubmit').click
    assert @driver.alert.text == "Proporcione todos los datos, por favor."
    @driver.alert.ok
  end
  
end

describe "WB.BF Login rfc y password vacios", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto(@base_url + "/login.jsp")
    @driver.text_field(:name => 'j_username').set BFAPP_CONFIG['usernameAD']
    @driver.button(:id => 'btnSubmit').click
    assert @driver.alert.text == "Proporcione todos los datos, por favor."
    @driver.alert.ok
  end
  
end

describe "WB.BF Login username y password vacios", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto(@base_url + "/login.jsp")
    @driver.text_field(:name => 'j_rfc').set BFAPP_CONFIG['rfcAD']
    @driver.button(:id => 'btnSubmit').click
    assert @driver.alert.text == "Proporcione todos los datos, por favor."
    @driver.alert.ok
  end
  
end

describe "WB.BF Login rfc y username vacios", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto(@base_url + "/login.jsp")
    @driver.text_field(:name => 'j_password').set BFAPP_CONFIG['passwordAD']
    @driver.button(:id => 'btnSubmit').click
    assert @driver.alert.text == "Proporcione todos los datos, por favor."
    @driver.alert.ok
  end
  
end

describe "WB.BF Login rfc vacio", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto(@base_url + "/login.jsp")
    @driver.text_field(:name => 'j_username').set BFAPP_CONFIG['usernameAD']
    @driver.text_field(:name => 'j_password').set BFAPP_CONFIG['passwordAD']
    @driver.button(:id => 'btnSubmit').click
    assert @driver.alert.text == "Proporcione todos los datos, por favor."
    @driver.alert.ok
  end
  
end

describe "WB.BF Login username vacio", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto(@base_url + "/login.jsp")
    @driver.text_field(:name => 'j_rfc').set BFAPP_CONFIG['rfcAD']
    @driver.text_field(:name => 'j_password').set BFAPP_CONFIG['passwordAD']
    @driver.button(:id => 'btnSubmit').click
    assert @driver.alert.text == "Proporcione todos los datos, por favor."
    @driver.alert.ok
  end
  
end

describe "WB.BF Login password vacio", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto(@base_url + "/login.jsp")
    @driver.text_field(:name => 'j_rfc').set BFAPP_CONFIG['rfcAD']
    @driver.text_field(:name => 'j_username').set BFAPP_CONFIG['usernameAD']
    @driver.button(:id => 'btnSubmit').click
    assert @driver.alert.text == "Proporcione todos los datos, por favor."
    @driver.alert.ok
  end
  
end

describe "WB.BF Login usuario invalido", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto(@base_url + "/login.jsp")
    @driver.text_field(:name => 'j_rfc').set "GUCM870526GP8"
    @driver.text_field(:name => 'j_username').set "admin"
    @driver.text_field(:name => 'j_password').set "admin"
    @driver.button(:id => 'btnSubmit').click
    assert @driver.div(:id => 'login-error-message').text == "Acceso no permitido.   Razón: Usuario 'admin' no encontrado."
  end
  
end

describe "WB.BF Login contraseña invalida", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto(@base_url + "/login.jsp")
    @driver.text_field(:name => 'j_rfc').set BFAPP_CONFIG['rfcAD']
    @driver.text_field(:name => 'j_username').set BFAPP_CONFIG['usernameAD']
    @driver.text_field(:name => 'j_password').set "12345"
    @driver.button(:id => 'btnSubmit').click
    assert @driver.div(:id => 'login-error-message').text.include? 'Acceso no permitido.   Razón: El RFC, la Cuenta y/o la contraseña no son correctos, favor de revisarlos.'
  end
  
end

describe "WB.BF Login usuario administrador", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    assert @driver.title == "Buzón Fiscal® - Factura Electrónica"
    @driver.element(:name => "sal").should exist
  end
  
end

describe "WB.BF Login usuario operador", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_operador"
  
  it Time.now do
    assert @driver.title == "Buzón Fiscal® - Factura Electrónica"
    @driver.element(:name => "sal").should exist
  end
  
end
