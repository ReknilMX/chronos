require "conector_fiscal_spec_helper"

describe "WB.CF.C.ParImp Editar", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    #@driver.find_element(:link, "Impuestos").click
    @driver.get(@base_url + "/configuracion/empresa/impuestos.mvc")
    @driver.find_element(:xpath, "//table[@id='impuesto']/tbody/tr[3]/td[6]/a/img").click
    @driver.find_element(:name, "tasa").clear
    @driver.find_element(:name, "tasa").send_keys "16.00"
    @driver.find_element(:name, "guardar_tasa").click
  end
  
end
