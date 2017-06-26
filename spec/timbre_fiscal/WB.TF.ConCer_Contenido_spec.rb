require "timbre_fiscal_spec_helper"

describe "WB.TF.ConCer Contenido", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
  	@driver.find_element(:xpath, "//li[@id='configuracion']/a/div/div[4]").click
    @driver.find_element(:link, "certificados").click
    assert @driver.find_element(:xpath, "//ul[@class='breadcrumb']//li[.='certificados']")
  end
  
end
