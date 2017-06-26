require "conector_fiscal_spec_helper"

describe "WB.CF.C.ParDes Editar", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.get(@base_url + "/configuracion/empresa/descuentos.mvc")
    @driver.find_element(:xpath, "//tr[@class='odd']/td[3]/a/img").click
    @driver.find_element(:name, "cantidad").clear
    @driver.find_element(:name, "cantidad").send_keys "10"
    @driver.find_element(:name, "guardar_dcto").click
  end
  
end
