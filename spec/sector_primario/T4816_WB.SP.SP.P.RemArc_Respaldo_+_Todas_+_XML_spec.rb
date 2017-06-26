require "sector_primario_spec_helper"

describe "T4816 WB.SP.SP.P.RemArc Respaldo + Todas + XML", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Nombre Productor")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "TOMAS TELIO SALAZAR"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:name, "todos").click
    @driver.find_element(:name, "respaldo").click
    @driver.find_element(:name, "certificado").clear
    @driver.find_element(:name, "certificado").send_keys "Prueba XML"
    @driver.find_element(:name, "_finish").click
  end
  
end
