require "conector_fiscal_spec_helper"

describe "WB.CF.P.ComAEm Canclear", :sauce => CFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"
  
  it Time.now do
    @driver.find_element(:link, "Archivo Emitidos").click
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "search.criteria")).select_by(:text, "RFC")
    @driver.find_element(:id, "value").clear
    @driver.find_element(:id, "value").send_keys "TES"
    @driver.find_element(:name, "_target1").click
    @driver.find_element(:id, "checkboxes.id").click
    @driver.find_element(:name, "_target4").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "Esta usted a punto de cancelar el Comprobante Fiscal Digital señalado anteriormente, si está seguro de concluir el proceso presione el botón aceptar, de lo contrario de clic en regresar." }
    @driver.find_element(:name, "_target5").click
    verify { (@driver.find_element(:css, "p.mensaje").text).should == "Se ha efectuado con éxito la cancelación del o los comprobante(s) seleccionado(s)." }
  end
  
end
