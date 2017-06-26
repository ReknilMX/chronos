require "timbre_fiscal_spec_helper"

describe "WB.TF Login", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
  end
  
end
