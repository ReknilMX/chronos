require "sector_primario_spec_helper"

describe "T4841 WB.SP.SP.C.DaGCer Ver Certificado", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Certificados").click
    @driver.find_element(:css, "td.colgris.colbuttons > a > img").click
    verify { (@driver.find_element(:css, "td.certificado").text).should == "Información del certificado" }
  end
  
end
