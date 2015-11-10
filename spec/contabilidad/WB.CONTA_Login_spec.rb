# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA Login Datos Vacios", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "datos_vacios"

  it Time.now do
    @driver.text.include?("Favor de ingresar el nombre de usuario.").should == true
    @driver.text.include?("Favor de ingresar la contraseña.").should == true
  end

end

describe "WB.CONTA Usuario vacio", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "usuario_vacio"

  it Time.now do
    @driver.text.include?("Favor de ingresar el nombre de usuario.").should == true
  end

end

describe "WB.CONTA Usuario vacio", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "password_vacio"

  it Time.now do
    @driver.text.include?("Favor de ingresar la contraseña.").should == true
  end

end

describe "WB.CONTA Login Usuario Invalido", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "usuario_invalido"

  it Time.now do
    @driver.text.include?("El Usuario no existe").should == true
  end

end

describe "WB.CONTA Login Password Invalido", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "password_invalido"

  it Time.now do
    @driver.text.include?("El Password es incorrecto").should == true
  end

end

describe "WB.CONTA Login Cliente CE", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.text.include?('Bienvenido ' +  CONTAAPP_CONFIG['usernameCLICE']).should == true
  end

end

describe "WB.CONTA Login Contador CE", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CE"

  it Time.now do
    @driver.text.include?('Bienvenido ' +  CONTAAPP_CONFIG['usernameCONCE']).should == true
  end

end

describe "WB.CONTA Login Financiero CE", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_financiero_CE"

  it Time.now do
    @driver.text.include?('Bienvenido ' +  CONTAAPP_CONFIG['usernameFINCE']).should == true
  end

end

describe "WB.CONTA Login Cliente CE + PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.text.include?('Bienvenido ' +  CONTAAPP_CONFIG['usernameCLICEPR']).should == true
  end

end

describe "WB.CONTA Login Contador CE + PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.text.include?('Bienvenido ' +  CONTAAPP_CONFIG['usernameCONCEPR']).should == true
  end

end

describe "WB.CONTA Login Financiero CE + PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_financiero_CEPR"

  it Time.now do
    @driver.text.include?('Bienvenido ' +  CONTAAPP_CONFIG['usernameFINCEPR']).should == true
  end

end
