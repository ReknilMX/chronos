require "buzon_fiscal_spec_helper"

describe "WB.BF.C.UsuAdm_Eliminar", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    #@driver.find_element(:link, "Administración").click
    @driver.get(@base_url + "/configuracion/usuarios/AdministraUsuarios.mvc")
    @driver.find_element(:css, "img[alt=\"Eliminar registro\"]").click
    verify { @driver.find_element(:css, "p.mensaje").text.include?("¿Acepta efectuar el cambio?") }
    @driver.find_element(:name, "_finish").click
    verify { (@driver.find_element(:css, "div.txtazul").text).should == "La operación fue realizada con éxito" }
  end
  
end
