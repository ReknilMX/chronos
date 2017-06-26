require "timbre_fiscal_spec_helper"

describe "WB.TF.ArcTim Busqueda Uuid", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "timbrados").click
    @driver.find_element(:link, "RFC").click
    @driver.find_element(:xpath, "//ul[@class='select2-results']//div[.='Uuid']").click
    @driver.find_element(:name, "search.value").send_keys "c70f20b6-6dea-49cb-b0f3-8f6e76280fdf"
    @driver.find_element(:name, "_target1").click
    sleep(3.seconds)
    assert @driver.find_element(:css, ".bannerluis > tbody:nth-child(1) > tr:nth-child(1) > td:nth-child(1)").text.should =~ /1 Resultado encontrado./
    assert @driver.find_element(:xpath, "//table[@id='cfd']/tbody/tr[1]/td[4]").text.should =~ /Celina Emilia López Morales/
  end
  
end
