# encoding: utf-8

require "nomina_fiscal_spec_helper"

describe "WB.NF.Com Busqueda Concepto Empleado", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_empleado"

  it Time.now do
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_emission_date_gteq_2i")).select_by(:text, "enero")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_emission_date_gteq_1i")).select_by(:text, "2015")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_emission_date_lteq_2i")).select_by(:text, "diciembre")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_emission_date_lteq_1i")).select_by(:text, "2015")
    @driver.find_element(:id, "search_term").send_keys "Pago de nómina por 2a Quincena de Mayo de 2015"
    @driver.find_element(:name, "button").click
    sleep(5.seconds)
    assert @driver.find_element(:id, "total_receipts").text.should =~ /1/
    @driver.find_element(:css, "a.user_close_session").click
  end

end