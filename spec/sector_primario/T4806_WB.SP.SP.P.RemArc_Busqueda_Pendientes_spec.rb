require "sector_primario_spec_helper"

describe "T4806 WB.SP.SP.P.RemArc Busqueda Pendientes", :sauce => SPAPP_CONFIG['sauce'] do
  
  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Nombre Productor")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "Pruebas"
    @driver.find_element(:name, "busqueda").click
    assert @driver.find_element(:xpath, "//tr[@class='odd']/td[2]").text.should =~ /Pruebas/
    assert @driver.find_element(:xpath, "//tr[@class='odd']/td[7]").text.should == /Pendiente/
    @driver.find_element(:id, "checkboxes.id").click
    @driver.find_element(:css, "img[alt=\"Ver Remision\"]").click
    # ERROR: Caught exception [ERROR: Unsupported command [waitForPopUp | verCFD | 30000]]
  end

end
