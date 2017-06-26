require "conector_fiscal_spec_helper"

describe "WB.CF.C.ParImp Eliminar", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    #@driver.find_element(:link, "Impuestos").click
    @driver.get(@base_url + "/configuracion/empresa/impuestos.mvc")
    @driver.find_element(:xpath, "//table[@id='impuesto']/tbody/tr[3]/td[7]/a/img").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "Al eliminar este registro no podrá afectar con esta tasa de impuesto a sus comprobantes fiscales digitales." }
    @driver.find_element(:name, "_finish").click
  end
  
end
