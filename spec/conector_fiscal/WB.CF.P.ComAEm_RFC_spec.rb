require "conector_fiscal_spec_helper"

describe "WB.CF.P.ComAEm RFC", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo Emitidos").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "RFC")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "TES"
    @driver.find_element(:name, "_target1").click
    verify { (@driver.find_element(:xpath, "//table[@id='cfd']/tbody/tr[1]/td[3]").text).should == "Pruebas Conector Fiscal Diverza" }
  end
  
end
