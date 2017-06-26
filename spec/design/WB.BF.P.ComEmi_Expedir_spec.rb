require "design_spec_helper"

describe "WB.BF.P.ComEmi Expedir", :sauce => BFAPP_CONFIG['sauce'] do

  include_context "config"
  
  it Time.now do

    #Login
    @base_url = BFAPP_CONFIG['base_url']
    @driver.goto("https://q-amber.diverza.com/login.jsp")
    @driver.text_field(:name => 'j_rfc').set "SSO010101TTT"
    @driver.text_field(:name => 'j_username').set "gutierrez"
    @driver.text_field(:name => 'j_password').set "QAadministra2*"
    @driver.button(:id => 'btnSubmit').click

    #Expedir
    @driver.element(:link => "Emisión").click
    @driver.select_list(:name => "tipoDocumento").select "Factura"
    @driver.element(:css => "input[type=\"image\"]").click
    @driver.text_field(:id => "razonSocial").set "Pruebas"
    @driver.element(:name => "busqueda").click
    @driver.element(:id => "checkboxes.id").click
    @driver.select_list(:xpath => "//table[@id='remision']/tbody/tr[1]/td[5]/select").select "A"
    @driver.element(:id => "expedir").click
    assert @driver.element(:css => "p.mensaje").text.include? 'Los Comprobantes Fiscales Digitales han sido expedidos y almacenados en su buzón.'
  end
  
end
