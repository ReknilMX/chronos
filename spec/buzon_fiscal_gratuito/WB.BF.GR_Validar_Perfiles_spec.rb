# encoding: utf-8

require "buzon_fiscal_gratuito_spec_helper"

describe "WB.BF.GR Validar Perfil Gratuito", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_gratuito"

  it Time.now do

    #Menu Lateral Portafolio
    @driver.link(:text => "Captura Remisión").should exist
    @driver.link(:text => "Archivo Remisiones").should exist
    @driver.link(:text => "Emisión CFDs").should exist
    @driver.link(:text => "Archivo CFDs").should exist

    #Menu Lateral Configuración
    @driver.link(:text => "Datos Empresa").should exist
    @driver.link(:text => "Contraseña").should exist
    @driver.link(:text => "Instala Certificado").should exist
    @driver.link(:text => "CFDs aplicables").should exist
    @driver.link(:text => "Habilita Folios").should exist
    @driver.link(:text => "Impuestos").should exist
    @driver.link(:text => "Descuentos").should exist

    #Menu Lateral Fin
    @driver.link(:text => "Salir").should exist

    #Contenido
    @driver.element(:class => "titleheader").should exist

  end

end
