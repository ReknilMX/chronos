# encoding: utf-8

require "buzon_fiscal_gratuito_spec_helper"

describe "WB.BF.GR Login Datos Vacios", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_vacio"

  it Time.now do
    @driver.alert.exists?
    @driver.alert.ok
  end

end

describe "WB.BF.GR RFC vacio", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "rfc_vacio"

  it Time.now do
    @driver.alert.exists?
    @driver.alert.ok
  end

end

describe "WB.BF.GR Usuario vacio", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "usuario_vacio"

  it Time.now do
    @driver.alert.exists?
    @driver.alert.ok
  end

end

describe "WB.BF.GR Password vacio", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "password_vacio"

  it Time.now do
    @driver.alert.exists?
    @driver.alert.ok
  end

end

describe "WB.BF.GR Login RFC Invalido", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "rfc_invalido"

  it Time.now do
    @driver.text.include?("Acceso no permitido.").should == true
  end

end

describe "WB.BF.GR Login Usuario Invalido", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "usuario_invalido"

  it Time.now do
    @driver.text.include?("Acceso no permitido.").should == true
  end

end

describe "WB.BF.GR Login Password Invalido", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "password_invalido"

  it Time.now do
    @driver.text.include?("Acceso no permitido.").should == true
  end

end

describe "WB.BF.GR Login Gratuito", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do
    @driver.link(:text => "Captura Remisión").should exist
  end

end
