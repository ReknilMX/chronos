require "sector_primario_spec_helper"

describe "T4789 WB.SP.AR.P.ComAEm Busqueda", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_arrendatario"
  
  it Time.now do
    @driver.find_element(:link, "Archivo Emitidos").click
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "RAMA"
    @driver.find_element(:name, "_target1").click
    verify { (@driver.find_element(:xpath, "//table[@id='cfd']/tbody/tr/td[3]").text).should == "RUPERTO TREVIÑO SAENZ" }
  end
  
end
