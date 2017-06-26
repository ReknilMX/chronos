require "sector_primario_spec_helper"

describe "WB.SP.SP.P.RemCap Precarga Existente", :sauce => SPAPP_CONFIG['sauce'] do
  
  include_context "config"
  include_context "login_admin"
  
  it Time.now do
    @driver.find_element(:link, "Captura").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "criteria")).select_by(:text, "Nombre")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "mario"
    @driver.find_element(:name, "busqueda").click
    @driver.find_element(:css, "tr.even > td.colgris > input[name=\"idCliente\"]").click
    @driver.find_element(:css, "#boton > input[type=\"image\"]").click
    verify { @driver.find_element(:id, "clienteModel.nombre").attribute("value").should =~ /^[\s\S]*$/ }
    verify { @driver.find_element(:id, "clienteModel.rfc").attribute("value").should =~ /^[\s\S]*$/ }
    verify { @driver.find_element(:id, "clienteModel.domicilio.calle").attribute("value").should =~ /^[\s\S]*$/ }
    verify { @driver.find_element(:id, "clienteModel.domicilio.noExterior").attribute("value").should =~ /^[\s\S]*$/ }
    verify { @driver.find_element(:id, "clienteModel.domicilio.noInterior").attribute("value").should =~ /^[\s\S]*$/ }
    verify { @driver.find_element(:id, "clienteModel.domicilio.referencia").attribute("value").should =~ /^[\s\S]*$/ }
    verify { @driver.find_element(:id, "clienteModel.domicilio.colonia").attribute("value").should =~ /^[\s\S]*$/ }
    verify { @driver.find_element(:id, "clienteModel.domicilio.localidad").attribute("value").should =~ /^[\s\S]*$/ }
    verify { @driver.find_element(:id, "clienteModel.domicilio.municipio").attribute("value").should =~ /^[\s\S]*$/ }
    verify { @driver.find_element(:id, "clienteModel.domicilio.estado").attribute("value").should =~ /^[\s\S]*$/ }
    verify { @driver.find_element(:id, "clienteModel.domicilio.pais").attribute("value").should =~ /^[\s\S]*$/ }
    verify { @driver.find_element(:id, "clienteModel.domicilio.codigoPostal").attribute("value").should =~ /^[\s\S]*$/ }
    verify { (@driver.find_element(:id, "clienteModel.contactoAdministrativo.telefono").attribute("value")).should == "" }
    verify { (@driver.find_element(:id, "clienteModel.contactoAdministrativo.fax").attribute("value")).should == "" }
  end
  
end
