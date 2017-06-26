require "conector_fiscal_spec_helper"

describe "WB.CF.P.ComEmi BusquedaMonto", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Emisión").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "tipoDocumento")).select_by(:text, "Factura")
    @driver.find_element(:css, "input[type=\"image\"]").click
    @driver.find_element(:id, "monto").clear
    @driver.find_element(:id, "monto").send_keys "11.60"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:xpath, "//table[@id='remision']/tbody/tr[1]/td[2]").text).should == "Pruebas Conector Fiscal Diverza" }
  end
  
end
