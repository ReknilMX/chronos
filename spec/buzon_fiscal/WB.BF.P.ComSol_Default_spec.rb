require "buzon_fiscal_spec_helper"

describe "WB.BF.P.ComSol Default", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:xpath, "//a[contains(@href, '/portafolio/notificaciones/solicitudes.mvc')]").click
    verify { (@driver.find_element(:css, "h1").text).include?("Notificaciones :: Mensajes") }
  end
  
end
