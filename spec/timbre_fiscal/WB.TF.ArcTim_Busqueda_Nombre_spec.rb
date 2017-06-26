require "timbre_fiscal_spec_helper"

describe "WB.TF.ArcTim Busqueda Nombre", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "timbrados").click
    @driver.find_element(:link, "RFC").click
    @driver.find_element(:xpath, "//ul[@class='select2-results']//div[.='Cliente']").click
    @driver.find_element(:name, "search.value").send_keys "Celina"
    @driver.find_element(:name, "_target1").click
    sleep(3.seconds)
    assert @driver.find_element(:css, ".bannerluis > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1)").text.should =~ /Resultado/
    assert @driver.find_element(:xpath, "//table[@id='cfd']/tbody/tr[1]/td[4]").text.should =~ /Celina Emilia López Morales/
  end
  
end
