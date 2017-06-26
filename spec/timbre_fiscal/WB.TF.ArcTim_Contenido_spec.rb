require "timbre_fiscal_spec_helper"

describe "WB.TF.ArcTim Contenido", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "timbrados").click
    verify { (@driver.find_element(:xpath, "//form[@id='command']/div/div[3]/div[2]").text).should == "Ultimos comprobantes fiscales digitales." }
  end
  
end
