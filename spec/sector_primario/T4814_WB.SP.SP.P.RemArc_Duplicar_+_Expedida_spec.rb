require "sector_primario_spec_helper"

describe "T4814 WB.SP.SP.P.RemArc Duplicar + Expedida", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Archivo").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "Nombre Productor")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "LARIOS ALCARAZ ADRIAN"
    @driver.find_element(:name, "busqueda").click
    verify { element_present?(:css, "img[alt=\"Duplicar Remisión\"]").should be_true }
    @driver.find_element(:css, "img[alt=\"Duplicar Remisión\"]").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "Esta remisión electrónica ha sido convertida a un Comprobante Fiscal Digital. \n\n Puede reutilizar la información para generar una nueva remisión actualizando los datos que sean necesarios. \n\n Presione en Duplicar para realizar la operación antes mencionada de lo contrario de clic en Regresar y volverá al listado de remisiones almacenadas." }
    @driver.find_element(:name, "_finish").click
  end
  
end
