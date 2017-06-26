require "sector_primario_spec_helper"

describe "WB.SP Login Invalido", :sauce => SPAPP_CONFIG['sauce'] do
  
  include_context "config"
  include_context "login_invalido"

  it Time.now do
  	verify { (@driver.find_element(:css, "#login-error-message > div").text).should == "Acceso no permitido.   Razón: Bad credentials" }
   end

end
