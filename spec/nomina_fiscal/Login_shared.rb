# encoding: utf-8

RSpec.shared_context "login_invalido", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/users/sign_in")
    @driver.find_element(:id, "user_username").send_keys "GUCM870526NF4"
    @driver.find_element(:id, "user_password").send_keys "admin"
    @driver.find_element(:name, "button").click
  end
end

RSpec.shared_context "login_administrador", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/users/sign_in")
    @driver.find_element(:id, "user_username").send_keys NFAPP_CONFIG['usernameAD']
    @driver.find_element(:id, "user_password").send_keys NFAPP_CONFIG['passwordAD']
    @driver.find_element(:name, "button").click
  end
end

RSpec.shared_context "login_operador", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/users/sign_in")
    @driver.find_element(:id, "user_username").send_keys NFAPP_CONFIG['usernameOP']
    @driver.find_element(:id, "user_password").send_keys NFAPP_CONFIG['passwordOP']
    @driver.find_element(:name, "button").click
  end
end

RSpec.shared_context "login_empleado", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/users/sign_in")
    @driver.find_element(:id, "user_username").send_keys NFAPP_CONFIG['usernameEM']
    @driver.find_element(:id, "user_password").send_keys NFAPP_CONFIG['passwordEM']
    @driver.find_element(:name, "button").click
  end
end

RSpec.shared_context "login_recursos", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/users/sign_in")
    @driver.find_element(:id, "user_username").send_keys NFAPP_CONFIG['usernameHR']
    @driver.find_element(:id, "user_password").send_keys NFAPP_CONFIG['passwordHR']
    @driver.find_element(:name, "button").click
  end
end

RSpec.shared_context "login_conector", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/users/sign_in")
    @driver.find_element(:id, "user_username").send_keys NFAPP_CONFIG['usernameCF']
    @driver.find_element(:id, "user_password").send_keys NFAPP_CONFIG['passwordCF']
    @driver.find_element(:name, "button").click
  end
end

RSpec.shared_context "login_timbre", :a => :b do
  before(:each) do
    @driver.get(@base_url + "/users/sign_in")
    @driver.find_element(:id, "user_username").send_keys NFAPP_CONFIG['usernameTF']
    @driver.find_element(:id, "user_password").send_keys NFAPP_CONFIG['passwordTF']
    @driver.find_element(:name, "button").click
  end
end