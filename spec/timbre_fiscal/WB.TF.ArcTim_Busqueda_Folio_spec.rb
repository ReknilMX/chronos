require "timbre_fiscal_spec_helper"

describe "WB.TF.ArcTim Busqueda Folio", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "timbrados").click
    @driver.find_element(:link, "RFC").click
    @driver.find_element(:xpath, "//ul[@class='select2-results']//div[.='Folio']").click
    @driver.find_element(:name, "search.value").send_keys "1268"
    @driver.find_element(:name, "_target1").click
    sleep(3.seconds)
    assert @driver.find_element(:css, ".bannerluis > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1)").text.should =~ /Resultado/
    assert @driver.find_element(:xpath, "//table[@id='cfd']/tbody/tr[1]/td[3]").text.should =~ /1268/
  end
  
end
