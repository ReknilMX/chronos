require "buzon_fiscal_spec_helper"

describe "WB.BF.P.ComEmi Busqueda Nombre", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  after(:each) do
    @verification_errors.should == []
  end
  
  it Time.now do
    @driver.find_element(:link, "Emisión").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "tipoDocumento")).select_by(:text, "Factura")
    @driver.find_element(:css, "input[type=\"image\"]").click
    @driver.find_element(:id, "razonSocial").clear
    @driver.find_element(:id, "razonSocial").send_keys "Pruebas Buzon Fiscal"
    @driver.find_element(:name, "busqueda").click
    verify { (@driver.find_element(:xpath, "//table[@id='remision']/tbody/tr[1]/td[2]").text).should == "Pruebas Buzon Fiscal Diverza" }
  end
  
end
