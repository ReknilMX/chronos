require "sector_primario_spec_helper"

describe "T4840 WB.SP.SP.C.DaGCer Instalar Nuevo Certificado", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Certificados").click
    verify { @driver.find_element(:css, "table.bannerluis > tbody > tr > td").text.should =~ /^[\s\S]*Resultado encontrado\.$/ }
  end
  
end
