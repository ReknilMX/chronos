RSpec.shared_context "login_invalido", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_rfc").send_keys "GUCM870526GP8"
    @driver.find_element(:name, "j_username").send_keys "admin"
    @driver.find_element(:name, "j_password").send_keys "admin"
    @driver.find_element(:id, "btnSubmit").click
  end
end

RSpec.shared_context "login_administrador", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_rfc").send_keys TFAPP_CONFIG['rfcAD']
    @driver.find_element(:name, "j_username").send_keys TFAPP_CONFIG['usernameAD']
    @driver.find_element(:name, "j_password").send_keys TFAPP_CONFIG['passwordAD']
    @driver.find_element(:id, "btnSubmit").click
  end
end