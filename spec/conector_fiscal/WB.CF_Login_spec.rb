require "conector_fiscal_spec_helper"

describe "WB.CF Login", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
  end
  
end
