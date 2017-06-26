require "conector_fiscal_spec_helper"

describe "WB.CF.P.RemCap Consulta PEMEX RFC", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Captura").click
    @driver.find_element(:xpath, "//table[@class='contorno']/tbody/tr[4]/td/input").click
    @driver.find_element(:xpath, "//td[@class='repdatos']/input[2]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "criteria")).select_by(:text, "RFC")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "TES"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:xpath => "//table[@id='cliente']/tbody/tr/td[2]").text.include?("NO&")
  end
  
end
