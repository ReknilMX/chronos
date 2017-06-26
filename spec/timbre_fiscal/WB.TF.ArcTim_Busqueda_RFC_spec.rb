require "timbre_fiscal_spec_helper"

describe "WB.TF.ArcTim Busqueda RFC", :sauce => TFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "timbrados").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "tipoBusqueda")).select_by(:text, "RFC")
    @driver.find_element(:name, "search.value").send_keys "DIA"
    @driver.find_element(:name, "_target1").click
    verify { (@driver.find_element(:xpath, "//table[@id='cfd']//td[.='Celina Emilia López Morales']").text).should == "Celina Emilia López Morales" }
  end
  
end
