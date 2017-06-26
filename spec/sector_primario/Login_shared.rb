RSpec.shared_context "login_invalido", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/")
    @driver.find_element(:name, "j_rfc").clear
    @driver.find_element(:name, "j_rfc").send_keys "GUCM870526GP8"
    @driver.find_element(:name, "j_username").clear
    @driver.find_element(:name, "j_username").send_keys "admin"
    @driver.find_element(:name, "j_password").clear
    @driver.find_element(:name, "j_password").send_keys "admin"
    @driver.find_element(:id, "btnSubmit").click
  end
end

RSpec.shared_context "login_admin", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/")
    @driver.find_element(:name, "j_rfc").clear
    @driver.find_element(:name, "j_rfc").send_keys SPAPP_CONFIG['rfcSP']
    @driver.find_element(:name, "j_username").clear
    @driver.find_element(:name, "j_username").send_keys SPAPP_CONFIG['usernameSP']
    @driver.find_element(:name, "j_password").clear
    @driver.find_element(:name, "j_password").send_keys SPAPP_CONFIG['passwordSP']
    @driver.find_element(:id, "btnSubmit").click
  end
end

RSpec.shared_context "login_arrendatario", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/")
    @driver.find_element(:name, "j_rfc").clear
    @driver.find_element(:name, "j_rfc").send_keys SPAPP_CONFIG['rfcAR']
    @driver.find_element(:name, "j_username").clear
    @driver.find_element(:name, "j_username").send_keys SPAPP_CONFIG['usernameAR']
    @driver.find_element(:name, "j_password").clear
    @driver.find_element(:name, "j_password").send_keys SPAPP_CONFIG['passwordAR']
    @driver.find_element(:id, "btnSubmit").click
  end
end

RSpec.shared_context "login_reciclaje", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/")
    @driver.find_element(:name, "j_rfc").clear
    @driver.find_element(:name, "j_rfc").send_keys SPAPP_CONFIG['rfcRE']
    @driver.find_element(:name, "j_username").clear
    @driver.find_element(:name, "j_username").send_keys SPAPP_CONFIG['usernameRE']
    @driver.find_element(:name, "j_password").clear
    @driver.find_element(:name, "j_password").send_keys SPAPP_CONFIG['passwordRE']
    @driver.find_element(:id, "btnSubmit").click
  end
end