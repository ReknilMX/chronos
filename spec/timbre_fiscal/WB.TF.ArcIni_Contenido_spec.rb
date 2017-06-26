require "timbre_fiscal_spec_helper"

describe "WB.TF.ArcIni Contenido", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:id, "inicio").click
    verify { (@driver.find_element(:id, "rfcEmpresa").text).should == TFAPP_CONFIG['rfcAD'] }
  end
  
end
