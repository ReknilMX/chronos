require "conector_fiscal_spec_helper"

describe "WB.CF.C.ParImp Alta Federal", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    #@driver.find_element(:link, "Impuestos").click
    @driver.get(@base_url + "/configuracion/empresa/impuestos.mvc")
    @driver.find_element(:css, "input[type=\"image\"]").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "tipoImpuesto")).select_by(:text, "Federal")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "tipoDocumento")).select_by(:text, "Factura")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "categoria")).select_by(:text, "Retenido")
    @driver.find_element(:name, "tasa").clear
    @driver.find_element(:name, "tasa").send_keys "0.0011"
    @driver.find_element(:name, "tasa").clear
    @driver.find_element(:name, "tasa").send_keys "11.00"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "impuesto")).select_by(:text, "IVA")
    @driver.find_element(:css, "input[type=\"image\"]").click
  end
  
end
