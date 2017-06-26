require "sector_primario_spec_helper"

describe "T4793 WB.SP.AR.P.ComEmi Emision + Varias Remisiones", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_arrendatario"
  
  it Time.now do
    @driver.find_element(:link, "Emisión").click
    @driver.find_element(:id, "razonSocial").clear
    @driver.find_element(:id, "razonSocial").send_keys "RUPERTO TREVIÑO SAENZ"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:xpath, "//table[@id='remision']/tbody/tr[1]/td[1]/input").click
    @driver.find_element(:xpath, "//table[@id='remision']/tbody/tr[2]/td[1]/input").click
    @driver.find_element(:xpath, "//table[@id='remision']/tbody/tr[3]/td[1]/input").click
    @driver.find_element(:name, "expedir").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "Los Comprobantes Fiscales Digitales han sido expedidos y almacenados en su buzón." }
  end
  
end
