require "buzon_fiscal_spec_helper"

describe "WB.BF.C.Suc Eliminar", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.get(@base_url + "/configuracion/empresa/sucursales.mvc")
    @driver.find_element(:css, "#suc > tbody > tr > td.colgris.colbuttons > a > img").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "Está a punto de eliminar los datos de una sucursal. Tenga presente lo siguiente:" }
    @driver.find_element(:name, "_finish").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "La eliminación de la sucursal ha sido efectuada con éxito" }
  end
 
end
