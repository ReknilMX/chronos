require "sector_primario_spec_helper"

describe "WB.SP Login Admin", :sauce => SPAPP_CONFIG['sauce'] do
  include_context "config"
  include_context "login_admin"

  it Time.now do
  end

end
