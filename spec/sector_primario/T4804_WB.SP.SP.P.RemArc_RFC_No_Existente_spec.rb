require "sector_primario_spec_helper"

describe "T4804 WB.SP.SP.P.RemArc RFC No Existente", :sauce => SPAPP_CONFIG['sauce'] do
  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "RFC")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "XXX"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:css, "table.bannerluis > tbody > tr > td").text).should == "Ningún resultado." }
  end
  
end
