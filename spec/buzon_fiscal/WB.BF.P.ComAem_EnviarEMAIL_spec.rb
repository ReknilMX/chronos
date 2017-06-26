require "buzon_fiscal_spec_helper"

describe "WB.BF.P.ComAem Enviar EMAIL", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo Emitidos").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "RFC")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "TES"
    @driver.find_element(:name, "_target1").click
    @driver.find_element(:id, "checkboxes.id").click
    @driver.find_element(:name, "_target8").click
    @driver.find_element(:name, "canal").click
    @driver.find_element(:id, "enviar").click
    @driver.find_element(:name, "checkboxes.email").clear
    @driver.find_element(:name, "checkboxes.email").send_keys "mario.gutierrez@diverza.com"
    @driver.find_element(:name, "_target7").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "Se ha efectuado con éxito el envío del o los comprobante(s) seleccionado(s)." }
  end
  
end
