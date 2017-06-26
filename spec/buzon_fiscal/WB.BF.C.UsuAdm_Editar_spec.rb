require "buzon_fiscal_spec_helper"

describe "WB.BF.C.UsuAdm Editar", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    #@driver.find_element(:link, "Administración").click
    @driver.get(@base_url + "/configuracion/usuarios/AdministraUsuarios.mvc")
    @driver.find_element(:xpath, "//tr[@class='odd']/td[6]/a/img").click
    @driver.find_element(:name, "usuario.password").send_keys "Diverza123@"
    @driver.find_element(:name, "confimarPassword").send_keys "Diverza123@"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "perfil")).select_by(:text, "Administrador")
    @driver.find_element(:name, "_submit").click
    verify { (@driver.find_element(:css, "div.txtazul").text).should == "La operación fue realizada con éxito" }
    @driver.find_element(:name, "_target0").click
  end
  
end
