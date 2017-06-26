# encoding: utf-8

RSpec.shared_context "login_vacio", :a => :b do
  before(:each) do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto @base_url + "/login.jsp"
    @driver.button(:id => 'btnSubmit').click
  end
end

RSpec.shared_context "rfc_vacio", :a => :b do
  before(:each) do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto @base_url + "/login.jsp"
    @driver.text_field(:name => 'j_username').set BFAPP_CONFIG['usernameGR']
    @driver.text_field(:name => 'j_password').set BFAPP_CONFIG['passwordGR']
    @driver.button(:id => 'btnSubmit').click
  end
end

RSpec.shared_context "usuario_vacio", :a => :b do
  before(:each) do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto @base_url + "/login.jsp"
    @driver.text_field(:name => 'j_rfc').set BFAPP_CONFIG['rfcGR']
    @driver.text_field(:name => 'j_password').set BFAPP_CONFIG['passwordGR']
    @driver.button(:id => 'btnSubmit').click
  end
end

RSpec.shared_context "password_vacio", :a => :b do
  before(:each) do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto @base_url + "/login.jsp"
    @driver.text_field(:name => 'j_rfc').set BFAPP_CONFIG['rfcGR']
    @driver.text_field(:name => 'j_username').set BFAPP_CONFIG['usernameGR']
    @driver.button(:id => 'btnSubmit').click
  end
end

RSpec.shared_context "rfc_invalido", :a => :b do
  before(:each) do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto @base_url + "/login.jsp"
    @driver.text_field(:name => 'j_rfc').set "invalido"
    @driver.text_field(:name => 'j_username').set BFAPP_CONFIG['usernameGR']
    @driver.text_field(:name => 'j_password').set BFAPP_CONFIG['passwordGR']
    @driver.button(:id => 'btnSubmit').click
  end
end

RSpec.shared_context "usuario_invalido", :a => :b do
  before(:each) do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto @base_url + "/login.jsp"
    @driver.text_field(:name => 'j_rfc').set BFAPP_CONFIG['rfcGR']
    @driver.text_field(:name => 'j_username').set "invalido"
    @driver.text_field(:name => 'j_password').set BFAPP_CONFIG['passwordGR']
    @driver.button(:id => 'btnSubmit').click
  end
end

RSpec.shared_context "password_invalido", :a => :b do
  before(:each) do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto @base_url + "/login.jsp"
    @driver.text_field(:name => 'j_rfc').set BFAPP_CONFIG['rfcGR']
    @driver.text_field(:name => 'j_username').set BFAPP_CONFIG['usernameGR']
    @driver.text_field(:name => 'j_password').set "invalido"
    @driver.button(:id => 'btnSubmit').click
  end
end

RSpec.shared_context "login_gratuito", :a => :b do
  before(:each) do
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto @base_url + "/login.jsp"
    @driver.text_field(:name => 'j_rfc').set BFAPP_CONFIG['rfcGR']
    @driver.text_field(:name => 'j_username').set BFAPP_CONFIG['usernameGR']
    @driver.text_field(:name => 'j_password').set BFAPP_CONFIG['passwordGR']
    @driver.button(:id => 'btnSubmit').click
  end
end

