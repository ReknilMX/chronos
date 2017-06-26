require "buzon_fiscal_spec_helper"

describe "WB.BF.C.Suc Consulta", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.get(@base_url + "/configuracion/empresa/sucursales.mvc")
    @driver.find_element(:xpath, "//table[@id='suc']/tbody/tr/td[5]/a/img").click
    verify { (@driver.find_element(:css, "div.title3").text).include?("Nombre de Sucursal:") }
  end
  
end
