require "sector_primario_spec_helper"

describe "T4819 WB.SP.SP.C.Con Formato Incorrecto", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Contraseña").click
    @driver.find_element(:name, "passwordActual").clear
    @driver.find_element(:name, "passwordActual").send_keys "admin"
    @driver.find_element(:name, "passwordNuevo1").clear
    @driver.find_element(:name, "passwordNuevo1").send_keys "ñ"
    @driver.find_element(:name, "passwordNuevo2").clear
    @driver.find_element(:name, "passwordNuevo2").send_keys "ñ"
    @driver.find_element(:name, "_target1").click
    verify { element_present?(:css, "div.error").should be_true }
  end
  
end
