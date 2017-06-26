require "sector_primario_spec_helper"

describe "T4833 WB.SP.SP.P.ComEmi Paginador", :sauce => SPAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Emisión").click
    verify { @driver.find_element(:css, "table.bannerluis > tbody > tr > td").text.should =~ /^Resultados encontrados: 1-[\s\S]*$/ }
    @driver.find_element(:link, "Siguiente").click
    verify { @driver.find_element(:css, "table.bannerluis > tbody > tr > td").text.should =~ /^Resultados encontrados: 11-[\s\S]*$/ }
    @driver.find_element(:link, "Siguiente").click
    verify { @driver.find_element(:css, "table.bannerluis > tbody > tr > td").text.should =~ /^Resultados encontrados: 21-[\s\S]*$/ }
    @driver.find_element(:link, "Anterior").click
    verify { @driver.find_element(:css, "table.bannerluis > tbody > tr > td").text.should =~ /^Resultados encontrados: 11-[\s\S]*$/ }
    @driver.find_element(:link, "Anterior").click
    verify { @driver.find_element(:css, "table.bannerluis > tbody > tr > td").text.should =~ /^Resultados encontrados: 1-[\s\S]*$/ }
  end
  
end
