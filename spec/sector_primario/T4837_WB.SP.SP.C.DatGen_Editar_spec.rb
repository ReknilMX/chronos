require "sector_primario_spec_helper"

describe "T4837 WB.SP.SP.C.DatGen Editar", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Datos Generales").click
    @driver.find_element(:css, "img[alt=\"editar esta información\"]").click
    @driver.find_element(:name, "domicilioFiscal.noInterior").clear
    @driver.find_element(:name, "domicilioFiscal.noInterior").send_keys "C"
    @driver.find_element(:name, "_target1").click
    verify { @driver.find_element(:xpath, "//p[2]").text.should =~ /^exact:¿Acepta efectuar el cambio[\s\S]$/ }
    @driver.find_element(:name, "_finish").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "El cambio ha sido efectuado con éxito" }
    @driver.find_element(:link, "Datos Generales").click
    verify { (@driver.find_element(:xpath, "//td[6]").text).should == "C" }
  end
  
end
