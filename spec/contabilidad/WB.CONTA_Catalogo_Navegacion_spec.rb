# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA Consultar Catálogo de cuentas Cliente CE", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    assert  @driver.element(:css => 'h1.title').text == "Catálogo de cuentas"
  end

end

describe "WB.CONTA Consultar Catálogo de cuentas Contador CE", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    assert  @driver.element(:css => 'h1.title').text == "Catálogo de cuentas"
  end

end

describe "WB.CONTA Consultar Catálogo de cuentas Financiero CE", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_financiero_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    assert  @driver.element(:css => 'h1.title').text == "Catálogo de cuentas"
  end

end

describe "WB.CONTA Consultar Catálogo de cuentas Cliente CE+PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    assert  @driver.element(:css => 'h1.title').text == "Catálogo de cuentas"
  end

end

describe "WB.CONTA Consultar Catálogo de cuentas Contador CE+PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    assert  @driver.element(:css => 'h1.title').text == "Catálogo de cuentas"
  end

end

describe "WB.CONTA Consultar Catálogo de cuentas Financiero CE+PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_financiero_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    assert  @driver.element(:css => 'h1.title').text == "Catálogo de cuentas"
  end

end

describe "WB.CONTA Visualizar Catálogo de cuentas Cliente CE", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.element(:css => ".icon-view").click
  end

end

