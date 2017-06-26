require "timbre_fiscal_spec_helper"

describe "WB.TF.ArcTim Respaldar Comprobante", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "timbrados").click
    @driver.find_element(:link, "RFC").click
    @driver.find_element(:xpath, "//ul[@class='select2-results']//div[.='Uuid']").click
    @driver.find_element(:name, "search.value").send_keys "97fab16f-7b87-45d2-b681-2d27762adaab"
    @driver.find_element(:name, "_target1").click
    @driver.find_element(:id, "checkboxes.id").click
    @driver.find_element(:name, "_target3").click
  end
  
end

describe "WB.TF.ArcTim Respaldar Todos los Comprobantes", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "timbrados").click
    @driver.find_element(:link, "RFC").click
    @driver.find_element(:xpath, "//ul[@class='select2-results']//div[.='Folio']").click
    @driver.find_element(:name, "search.value").send_keys "1268"
    @driver.find_element(:name, "_target1").click
    @driver.find_element(:name, "todos").click
    @driver.find_element(:name, "_target3").click
  end
  
end