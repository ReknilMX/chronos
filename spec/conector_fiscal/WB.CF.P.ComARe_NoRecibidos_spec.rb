require "conector_fiscal_spec_helper"

describe "WB.CF.P.ComARe No Recibidos", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo Recibidos").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "No ha recibido comprobantes fiscales digitales." }
  end
  
end
