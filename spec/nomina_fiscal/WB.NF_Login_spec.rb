# encoding: utf-8

require "nomina_fiscal_spec_helper"

describe "WB.NF Login Administrador", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"

  it Time.now do
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF Login Operador", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_operador"

  it Time.now do
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF Login Empleado", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_empleado"

  it Time.now do
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF Login Human Resources", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_recursos"

  it Time.now do
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF Login Conector", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_conector"

  it Time.now do
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF Login Timbre", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_timbre"

  it Time.now do
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF Login Invalido", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_invalido"

  it Time.now do
    verify { (@driver.find_element(:css, "div.alert-message.alert > p").text).should == "Usuario y contraseña inválidos." }
  end

end