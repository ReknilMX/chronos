require "buzon_fiscal_spec_helper"

describe "WB.BF.P.ComAEn No Disponible", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo Entregados").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "No existe almacenado algún comprobante fiscal digital, vaya a la opción Expedición del menú izquierdo para realizar esta operación." }
  end
  
end
