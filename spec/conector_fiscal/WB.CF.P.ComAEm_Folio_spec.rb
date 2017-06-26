require "conector_fiscal_spec_helper"

describe "WB.CF.P.ComAEm Folio", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo Emitidos").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Folio")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "1"
    @driver.find_element(:name, "_target1").click
    verify { (@driver.find_element(:xpath, "//table[@id='cfd']/tbody/tr[1]/td[2]").text).include?("TEST 1") }
  end
  
end
