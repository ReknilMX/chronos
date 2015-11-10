# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA Validar Cierre de sesion por inactividad", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    sleep(1230.seconds)
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    @driver.div(text: 'Su sesión ha sido cerrada por inactividad, por favor ingresa nuevamente.').should exist
  end

end

describe "WB.CONTA Validar Cierre Normal", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Salir").click
    @driver.div(text: 'Hasta luego.').should exist
  end

end

describe "WB.CONTA Validar Sesion Activa", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver2 = Watir::Browser.new :firefox
    @driver2.goto @base_url
    @driver2.text_field(:id => 'session_username').set CONTAAPP_CONFIG['usernameCLICE']
    @driver2.text_field(:id => 'session_password').set CONTAAPP_CONFIG['passwordCLICE']
    @driver2.button(:name => 'commit').click
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.div(text: 'Solo puedes tener una sesión activa. Detectamos has entrado al sistema desde otro navegador. Si quieres continuar aquí, vuelve a identificarte.').should exist
    @driver2.close
  end

end
