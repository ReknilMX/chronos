require "conector_fiscal_spec_helper"

describe "WB.CF.C.UsuAdm Alta", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    #@driver.find_element(:link, "Administración").click
    @driver.get(@base_url + "/configuracion/usuarios/AdministraUsuarios.mvc")
    @driver.find_element(:css, "input[type=\"image\"]").click
    @driver.find_element(:name, "usuario.cuenta").clear
    @driver.find_element(:name, "usuario.cuenta").send_keys "GUCM870526GP8"
    @driver.find_element(:name, "usuario.password").clear
    @driver.find_element(:name, "usuario.password").send_keys "Diverza123@"
    @driver.find_element(:name, "confimarPassword").clear
    @driver.find_element(:name, "confimarPassword").send_keys "Diverza123@"
    @driver.find_element(:name, "usuario.nombre").clear
    @driver.find_element(:name, "usuario.nombre").send_keys "Mario Alfredo"
    @driver.find_element(:name, "usuario.apellidoPaterno").clear
    @driver.find_element(:name, "usuario.apellidoPaterno").send_keys "Gutierrez"
    @driver.find_element(:name, "usuario.apellidoMaterno").clear
    @driver.find_element(:name, "usuario.apellidoMaterno").send_keys "Chio"
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:name, "perfil")).select_by(:text, "Administrador")
    @driver.find_element(:name, "usuario.domicilio.calle").clear
    @driver.find_element(:name, "usuario.domicilio.calle").send_keys "Mozart"
    @driver.find_element(:name, "usuario.domicilio.noExterior").clear
    @driver.find_element(:name, "usuario.domicilio.noExterior").send_keys "13"
    @driver.find_element(:name, "usuario.domicilio.noInterior").clear
    @driver.find_element(:name, "usuario.domicilio.noInterior").send_keys "9"
    @driver.find_element(:name, "usuario.domicilio.colonia").clear
    @driver.find_element(:name, "usuario.domicilio.colonia").send_keys "Peralvillo"
    @driver.find_element(:name, "usuario.domicilio.municipio").clear
    @driver.find_element(:name, "usuario.domicilio.municipio").send_keys "Cuautemóc"
    @driver.find_element(:name, "usuario.domicilio.codigoPostal").clear
    @driver.find_element(:name, "usuario.domicilio.codigoPostal").send_keys "06220"
    @driver.find_element(:name, "usuario.domicilio.estado").clear
    @driver.find_element(:name, "usuario.domicilio.estado").send_keys "Distrito Federal"
    @driver.find_element(:name, "usuario.puesto").clear
    @driver.find_element(:name, "usuario.puesto").send_keys "QA"
    @driver.find_element(:name, "usuario.telefono").clear
    @driver.find_element(:name, "usuario.telefono").send_keys "5557827609"
    @driver.find_element(:name, "usuario.email").clear
    @driver.find_element(:name, "usuario.email").send_keys "mario.gutierrez@diverza.com"
    @driver.find_element(:name, "_finish").click
    verify { (@driver.find_element(:css, "div.txtazul").text).should == "La operacion fue realizada con éxito" }
  end
  
end
