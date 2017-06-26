require "buzon_fiscal_spec_helper"

describe "WB.BF.P.RemCap Consulta Basico RFC", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Captura").click
    @driver.find_element(:name, "formulario").click
    @driver.find_element(:xpath, "//td[@class='repdatos']/input[2]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "criteria")).select_by(:text, "RFC")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "TES"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:xpath => "//table[@id='cliente']/tbody/tr/td[2]").text.include?("NO&")
  end
  
end
