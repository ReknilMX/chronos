require "sector_primario_spec_helper"

describe "T4813 WB.SP.SP.P.RemArc Duplicar + Pendiente", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Nombre Productor")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "TOMAS MAYORAL LOPEZ"
    @driver.find_element(:name, "busqueda").click
    verify { element_present?(:css, "img[alt=\"Duplicar Remisión\"]").should be_false }
  end
  
end
