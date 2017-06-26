require "conector_fiscal_spec_helper"

describe "WB.CF.C.Suc Eliminar", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.get(@base_url + "/configuracion/empresa/sucursales.mvc")
    @driver.find_element(:css, "tr.even > td.colgris.colbuttons > a > img").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "Está a punto de eliminar los datos de una sucursal. Tenga presente lo siguiente:" }
    @driver.find_element(:name, "_finish").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "La eliminación de la sucursal ha sido efectuada con éxito" }
  end
  
end
