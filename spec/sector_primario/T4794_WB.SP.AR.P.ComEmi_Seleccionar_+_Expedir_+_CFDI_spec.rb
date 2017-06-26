require "sector_primario_spec_helper"

describe "T4794 WB.SP.AR.P.ComEmi Seleccionar + Expedir + CFDI", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_arrendatario"
  
  it Time.now do
    @driver.find_element(:link, "Emisión").click
    @driver.find_element(:id, "razonSocial").clear
    @driver.find_element(:id, "razonSocial").send_keys "RUPERTO TREVIÑO SAENZ"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:name, "checkboxes.id").click
    @driver.find_element(:name, "expedir").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "Los Comprobantes Fiscales Digitales han sido expedidos y almacenados en su buzón." }
    @driver.find_element(:css, "img[alt=\"consultar CFD's expedidos\"]").click
    @driver.find_element(:css, "img[alt=\"Ver CFD\"]").click
    # ERROR: Caught exception [ERROR: Unsupported command [waitForPopUp | verCFD | 30000]]
  end
  
end
