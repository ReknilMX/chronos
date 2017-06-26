require "timbre_fiscal_spec_helper"

describe "WB.TF.ConCon Contenido", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
  	@driver.find_element(:xpath, "//li[@id='configuracion']/a/div/div[4]").click
    @driver.find_element(:link, "contraseñas").click
    #verify @driver.find_element(:name, "//ul[@class='breadcrumb']//li[.='contraseña']")
    verify { (@driver.find_element(:css, "form > div.span10 > span").text).should == "Cambio de contraseña" }
  end
  
end
