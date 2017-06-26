require "sector_primario_spec_helper"

describe "T4791 WB.SP.SP.S.ComEmi Busqueda", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Emisión").click
    @driver.find_element(:id, "razonSocial").clear
    @driver.find_element(:id, "razonSocial").send_keys "TOMAS TELIO SALAZAR"
    @driver.find_element(:name, "busqueda").click
    verify { @driver.find_element(:css, "table.bannerluis > tbody > tr > td").text.should =~ /^[\s\S]*Resultados encontrados:[\s\S]*$/ }
  end
  
end
