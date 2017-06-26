require "buzon_fiscal_spec_helper"

describe "WB.BF.C.ParImp Alta Local", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    #@driver.find_element(:link, "Impuestos").click
    @driver.get(@base_url + "/configuracion/empresa/impuestos.mvc")
    @driver.find_element(:css, "input[type=\"image\"]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "tipoImpuesto")).select_by(:text, "Local")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "tipoDocumento")).select_by(:text, "Factura")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "categoria")).select_by(:text, "Retenido")
    @driver.find_element(:name, "tasa").clear
    @driver.find_element(:name, "tasa").send_keys "3.00"
    @driver.find_element(:id, "impuesto").clear
    @driver.find_element(:id, "impuesto").send_keys "Municipal"
    @driver.find_element(:css, "input[type=\"image\"]").click
  end
  
end
