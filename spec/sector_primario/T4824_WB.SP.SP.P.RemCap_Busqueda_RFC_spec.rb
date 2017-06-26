require "sector_primario_spec_helper"

describe "WB.SP.SP.P.RemCap Busqueda RFC", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"

  it Time.now do
    @driver.find_element(:link, "Captura").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "criteria")).select_by(:text, "RFC")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "GAAM"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:xpath, "//table[@id='cliente']//td[.='MARIO ERNESTO GARCIA AGUIRRE']").text).should == "MARIO ERNESTO GARCIA AGUIRRE" }
  end
end
