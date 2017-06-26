# encoding: utf-8

RSpec.shared_context "login_administrador", :a => :b do
  before(:each) do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto(@base_url + "/login.jsp")
    @driver.text_field(:name => 'j_rfc').set BFAPP_CONFIG['rfcAD']
    @driver.text_field(:name => 'j_username').set BFAPP_CONFIG['usernameAD']
    @driver.text_field(:name => 'j_password').set BFAPP_CONFIG['passwordAD']
    @driver.button(:id => 'btnSubmit').click
  end
end

RSpec.shared_context "login_operador", :a => :b do
  before(:each) do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto(@base_url + "/login.jsp")
    @driver.text_field(:name => 'j_rfc').set BFAPP_CONFIG['rfcOP']
    @driver.text_field(:name => 'j_username').set BFAPP_CONFIG['usernameOP']
    @driver.text_field(:name => 'j_password').set BFAPP_CONFIG['passwordOP']
    @driver.button(:id => 'btnSubmit').click
  end
end