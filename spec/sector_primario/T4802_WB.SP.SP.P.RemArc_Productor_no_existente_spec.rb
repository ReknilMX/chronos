require "sector_primario_spec_helper"

describe "T4802 WB.SP.SP.P.RemArc Productor no existente", :sauce => SPAPP_CONFIG['sauce'] do
  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Nombre Productor")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "Ximeno"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:css, "table.bannerluis > tbody > tr > td").text).should == "Ningún resultado." }
  end
  
end
