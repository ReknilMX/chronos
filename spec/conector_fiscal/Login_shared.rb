RSpec.shared_context "login_invalido", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_rfc").clear
    @driver.find_element(:name, "j_rfc").send_keys "GUCM870526GP8"
    @driver.find_element(:name, "j_username").clear
    @driver.find_element(:name, "j_username").send_keys "admin"
    @driver.find_element(:name, "j_password").clear
    @driver.find_element(:name, "j_password").send_keys "admin"
    @driver.find_element(:id, "btnSubmit").click
  end
end

RSpec.shared_context "login_administrador", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_rfc").clear
    @driver.find_element(:name, "j_rfc").send_keys CFAPP_CONFIG['rfcAD']
    @driver.find_element(:name, "j_username").clear
    @driver.find_element(:name, "j_username").send_keys CFAPP_CONFIG['usernameAD']
    @driver.find_element(:name, "j_password").clear
    @driver.find_element(:name, "j_password").send_keys CFAPP_CONFIG['passwordAD']
    @driver.find_element(:id, "btnSubmit").click
  end
end

RSpec.shared_context "login_operador", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_rfc").clear
    @driver.find_element(:name, "j_rfc").send_keys CFAPP_CONFIG['rfcOP']
    @driver.find_element(:name, "j_username").clear
    @driver.find_element(:name, "j_username").send_keys CFAPP_CONFIG['usernameOP']
    @driver.find_element(:name, "j_password").clear
    @driver.find_element(:name, "j_password").send_keys CFAPP_CONFIG['passwordOP']
    @driver.find_element(:id, "btnSubmit").click
  end
end