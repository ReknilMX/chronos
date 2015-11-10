# encoding: utf-8

require "dpivaspec_helper"

describe "WB.CONTA Validar Perfil Cliente CE + PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    
    #Encabezado
    @driver.link(:text => "Cambiar contraseña").should exist
    @driver.link(:text => "Salir").should exist
    @driver.span(:class => "avatar").should exist

    #Menu Lateral
    @driver.link(:text => "Ver el manual de usuario y ayuda.").should exist
    @driver.link(:text => "Contabilidad").should exist
    @driver.link(:text => "Catálogo de cuentas").should exist
    @driver.link(:text => "Balanza de comprobación").should exist
    @driver.link(:text => "Pólizas contables").should exist
    @driver.link(:text => "DPIVA").should exist
    @driver.link(:text => "Certificados").should exist
    @driver.link(:text => "Actualizar cuenta").should_not exist

    #Pie de Pagina
    @driver.link(:text => "Términos y condiciones").should exist
    @driver.link(:text => "Aviso de privacidad").should exist

  end

end

describe "WB.CONTA Validar Perfil Contador CE + PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    
    #Encabezado
    @driver.link(:text => "Cambiar contraseña").should exist
    @driver.link(:text => "Salir").should exist
    @driver.span(:class => "avatar").should exist

    #Menu Lateral
    @driver.link(:text => "Ver el manual de usuario y ayuda.").should exist
    @driver.link(:text => "Contabilidad").should exist
    @driver.link(:text => "Catálogo de cuentas").should exist
    @driver.link(:text => "Balanza de comprobación").should exist
    @driver.link(:text => "Pólizas contables").should exist
    @driver.link(:text => "DPIVA").should exist
    @driver.link(:text => "Certificados").should_not exist
    @driver.link(:text => "Actualizar cuenta").should_not exist

    #Pie de Pagina
    @driver.link(:text => "Términos y condiciones").should exist
    @driver.link(:text => "Aviso de privacidad").should exist

  end

end

describe "WB.CONTA Validar Perfil Financiero CE + PR", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_financiero_CEPR"

  it Time.now do
    
    #Encabezado
    @driver.link(:text => "Cambiar contraseña").should exist
    @driver.link(:text => "Salir").should exist
    @driver.span(:class => "avatar").should exist

    #Menu Lateral
    @driver.link(:text => "Ver el manual de usuario y ayuda.").should exist
    @driver.link(:text => "Contabilidad").should exist
    @driver.link(:text => "Catálogo de cuentas").should exist
    @driver.link(:text => "Balanza de comprobación").should exist
    @driver.link(:text => "Pólizas contables").should exist
    @driver.link(:text => "DPIVA").should exist
    @driver.link(:text => "Certificados").should_not exist
    @driver.link(:text => "Actualizar cuenta").should_not exist

    #Pie de Pagina
    @driver.link(:text => "Términos y condiciones").should exist
    @driver.link(:text => "Aviso de privacidad").should exist

  end

end
