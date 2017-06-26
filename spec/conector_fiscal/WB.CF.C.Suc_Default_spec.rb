require "conector_fiscal_spec_helper"

describe "WB.CF.C.Suc Default", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.get(@base_url + "/configuracion/empresa/sucursales.mvc")
  end
  
end
