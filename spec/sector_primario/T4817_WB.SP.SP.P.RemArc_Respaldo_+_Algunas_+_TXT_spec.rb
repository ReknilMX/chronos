require "sector_primario_spec_helper"

describe "T4817 WB.SP.SP.P.RemArc Respaldo + Algunas + TXT", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Nombre Productor")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "TOMAS TELIO SALAZAR"
    @driver.find_element(:name, "busqueda").click
    #@driver.find_element(:id, "checkboxes.id").click
    @driver.find_element(:xpath, "//table[@id='remision']/tbody/tr[1]/td[1]/input[1]").click
    @driver.find_element(:xpath, "//table[@id='remision']/tbody/tr[2]/td[1]/input[1]").click
    @driver.find_element(:name, "respaldo").click
    @driver.find_element(:xpath, "//form[@id='command']/table/tbody/tr[6]/td/table/tbody/tr[1]/td[2]/table/tbody/tr/td[4]/input").click
    @driver.find_element(:name, "certificado").clear
    @driver.find_element(:name, "certificado").send_keys "Prueba TXT"
    @driver.find_element(:name, "_finish").click
  end
  
end
