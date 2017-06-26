require "sector_primario_spec_helper"

describe "T4812 WB.SP.SP.P.RemArc Edicion + Expedida No permitido", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Nombre Productor")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "MAY POOT TOMAS"
    @driver.find_element(:name, "busqueda").click
    verify { element_present?(:css, "tr.even > td.colgris.colbuttons > a > img[alt=\"Editar Remisión\"]").should be_false }
  end
  
end
