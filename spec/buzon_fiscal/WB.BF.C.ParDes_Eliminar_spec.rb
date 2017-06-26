require "buzon_fiscal_spec_helper"

describe "WB.BF.C.ParDes Eliminar", :sauce => BFAPP_CONFIG['sauce'] do
  
  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
  	#@driver.find_element(:link, "Descuentos").click
    @driver.get(@base_url + "/configuracion/empresa/descuentos.mvc")
    @driver.find_element(:xpath, "//tr[@class='odd']/td[4]/a/img").click
    verify { @driver.find_element(:xpath, "//p[2]").text.include?("¿Acepta efectuar la baja?") }
    @driver.find_element(:name, "_finish").click
  end
  
end
