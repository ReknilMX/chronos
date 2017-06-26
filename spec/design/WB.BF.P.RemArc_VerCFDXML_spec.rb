require "design_spec_helper"

describe "WB.BF.P.RemArc Ver CFD XML", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    #@driver.element(:text => "Archivo").click
    @driver.element(:xpath => "/html/body/table/tbody/tr[2]/td/table/tbody/tr/td/table/tbody/tr[1]/td/table/tbody/tr/td[1]/table/tbody/tr/td/table/tbody/tr[5]/td[2]/a").click
    @driver.select_list(:id => "search.criteria").select "Cliente"
    @driver.text_field(:id => "value").set "Pruebas"
    @driver.element(:name => "busqueda").click
    @driver.element(:xpath => "//table[@id='remision']//a[.='Status:']").click
    assert @driver.element(:xpath => "//table[@id='remision']/tbody/tr[1]/td[2]").text == "Pruebas Buzon Fiscal Diverza"
    assert @driver.element(:xpath => "//table[@id='remision']/tbody/tr[1]/td[7]").text == "Expedida"
    @driver.checkbox(:id => "checkboxes.id").set
    @driver.element(:css => "img[alt=\"Ver Remision\"]").click

    #@driver.windows.last.use do
    #  @driver.element(:xpath => "/html/body/table/tbody/tr/td/table/tbody/tr[2]/td/a[3]/img").click  
    #end
    #@driver.window(:url => @baseurl + "/portafolio/remisiones/verRemisionFrameSet.mvc?idRemision=" + "*").use do
    #  @driver.element(:xpath => "/html/body/table/tbody/tr/td/table/tbody/tr[2]/td/a[3]/img").click  
    #end

  end
  
end
