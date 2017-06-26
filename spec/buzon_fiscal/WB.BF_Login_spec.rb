require "buzon_fiscal_spec_helper"

describe "WB.BF Login Datos vacios", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
  	@driver.get(@base_url + "/login.jsp")
    @driver.find_element(:id, "btnSubmit").click
    @driver.switch_to.alert.accept
  end
  
end

describe "WB.BF Login rfc y password vacios", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
  	@driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_username").send_keys BFAPP_CONFIG['usernameAD']
    @driver.find_element(:id, "btnSubmit").click
    @driver.switch_to.alert.accept
  end
  
end

describe "WB.BF Login username y password vacios", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
  	@driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_rfc").send_keys BFAPP_CONFIG['rfcAD']
    @driver.find_element(:id, "btnSubmit").click
    @driver.switch_to.alert.accept
  end
  
end

describe "WB.BF Login rfc y username vacios", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
  	@driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_password").send_keys BFAPP_CONFIG['passwordAD']
    @driver.find_element(:id, "btnSubmit").click
    @driver.switch_to.alert.accept
  end
  
end

describe "WB.BF Login rfc vacio", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
  	@driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_username").send_keys BFAPP_CONFIG['usernameAD']
    @driver.find_element(:name, "j_password").send_keys BFAPP_CONFIG['passwordAD']
    @driver.find_element(:id, "btnSubmit").click
    @driver.switch_to.alert.accept
  end
  
end

describe "WB.BF Login username vacio", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
  	@driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_rfc").send_keys BFAPP_CONFIG['rfcAD']
    @driver.find_element(:name, "j_password").send_keys BFAPP_CONFIG['passwordAD']
    @driver.find_element(:id, "btnSubmit").click
    @driver.switch_to.alert.accept
  end
  
end

describe "WB.BF Login password vacio", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
  	@driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_rfc").send_keys BFAPP_CONFIG['rfcAD']
    @driver.find_element(:name, "j_username").send_keys BFAPP_CONFIG['usernameAD']
    @driver.find_element(:id, "btnSubmit").click
    @driver.switch_to.alert.accept
  end
  
end

describe "WB.BF Login usuario invalido", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do
  	@driver.get(@base_url + "/login.jsp")
    @driver.find_element(:name, "j_rfc").send_keys "GUCM870526GP8"
    @driver.find_element(:name, "j_username").send_keys "admin"
    @driver.find_element(:name, "j_password").send_keys "admin"
    @driver.find_element(:id, "btnSubmit").click
  end
  
end

describe "WB.BF Login usuario administrador", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
  end
  
end

describe "WB.BF Login usuario operador", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_operador"
  
  it Time.now do
  end
  
end

