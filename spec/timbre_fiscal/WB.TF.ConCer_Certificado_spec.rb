require "timbre_fiscal_spec_helper"

describe "WB.TF.ConCer Contenido", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
  	@driver.find_element(:xpath, "//li[@id='configuracion']/a/div/div[4]").click
    @driver.find_element(:link, "certificados").click
    @driver.find_element(:css, "img").click
    sleep(5.seconds)
    assert @driver.find_element(:xpath, "/html/body/div[2]/div/div[2]/div[3]/div/h4").text.should == "informacion del certificado"
  end
  
end
