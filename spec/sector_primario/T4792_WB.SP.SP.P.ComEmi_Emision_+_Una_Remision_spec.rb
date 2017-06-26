require "sector_primario_spec_helper"

describe "T4792 WB.SP.SP.P.ComEmi Emision + Una Remision", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Emisión").click
    @driver.find_element(:id, "razonSocial").clear
    @driver.find_element(:id, "razonSocial").send_keys "TOMAS TELIO SALAZAR"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:name, "checkboxes.id").click
    @driver.find_element(:name, "expedir").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "Los Comprobantes Fiscales Digitales han sido expedidos y almacenados en su buzón." }
  end
  
end
