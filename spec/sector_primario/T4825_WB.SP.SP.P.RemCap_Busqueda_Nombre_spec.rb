require "sector_primario_spec_helper"

describe "WB.SP.SP.P.RemCap Busqueda Nombre", :sauce => SPAPP_CONFIG['sauce'] do
  include_context "config"
  include_context "login_admin"

  it Time.now do
    @driver.find_element(:link, "Captura").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "criteria")).select_by(:text, "Nombre")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "mario"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:xpath, "//table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[2]/table/tbody/tr/td/table/tbody/tr[6]/td/span/table[2]/tbody/tr[2]/td/table/tbody/tr[1]/td[3]").text).should =~ /MARIO/ }
  end
  
end
