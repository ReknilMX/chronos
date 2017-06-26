require "sector_primario_spec_helper"

describe "T4838 WB.SP.SP.C.DatGen Cancelar Edicion", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Datos Generales").click
    @driver.find_element(:css, "img[alt=\"editar esta información\"]").click
    @driver.find_element(:name, "_cancel").click
    verify { element_present?(:css, "img[alt=\"editar esta información\"]").should be_true }
  end
  
end
