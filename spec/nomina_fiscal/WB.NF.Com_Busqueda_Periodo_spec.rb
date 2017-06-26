# encoding: utf-8

require "nomina_fiscal_spec_helper"

describe "WB.NF.Com Busqueda Periodo Administrador", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"

  it Time.now do
    @driver.find_element(:link_text, "Comprobantes").click
    sleep(5.seconds)
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_2i")).select_by(:text, "mayo")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_1i")).select_by(:text, "2015")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_period_concept_eq")).select_by(:text, "Pago de nómina por 2a Quincena de Mayo de 2015")
    @driver.find_element(:name, "button").click
    sleep(5.seconds)
    assert @driver.find_element(:css, "span.page.current").text.should =~ /1/
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF.Com Busqueda Periodo Operador", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_operador"

  it Time.now do
    @driver.find_element(:link_text, "Comprobantes").click
    sleep(5.seconds)
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_2i")).select_by(:text, "mayo")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_1i")).select_by(:text, "2015")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_period_concept_eq")).select_by(:text, "Pago de nómina por 2a Quincena de Mayo de 2015")
    @driver.find_element(:name, "button").click
    sleep(5.seconds)
    assert @driver.find_element(:css, "span.page.current").text.should =~ /1/
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF.Com Busqueda Periodo Human Resources", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_recursos"

  it Time.now do
    @driver.find_element(:link_text, "Comprobantes").click
    sleep(5.seconds)
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_2i")).select_by(:text, "mayo")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_1i")).select_by(:text, "2015")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_period_concept_eq")).select_by(:text, "Pago de nómina por 2a Quincena de Mayo de 2015")
    @driver.find_element(:name, "button").click
    sleep(5.seconds)
    assert @driver.find_element(:css, "span.page.current").text.should =~ /1/
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF.Com Busqueda Periodo Conector", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_conector"

  it Time.now do
    @driver.find_element(:link_text, "Comprobantes").click
    sleep(5.seconds)
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_2i")).select_by(:text, "mayo")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_1i")).select_by(:text, "2015")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_period_concept_eq")).select_by(:text, "Pago de nómina por 2a Quincena de Mayo de 2015")
    @driver.find_element(:name, "button").click
    sleep(5.seconds)
    assert @driver.find_element(:css, "span.page.current").text.should =~ /1/
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF.Com Busqueda Periodo Timbre", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_timbre"

  it Time.now do
    @driver.find_element(:link_text, "Comprobantes").click
    sleep(5.seconds)
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_2i")).select_by(:text, "mayo")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_1i")).select_by(:text, "2015")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_period_concept_eq")).select_by(:text, "Pago de nómina por 2a Quincena de Mayo de 2015")
    @driver.find_element(:name, "button").click
    sleep(5.seconds)
    assert @driver.find_element(:css, "span.page.current").text.should =~ /1/
    @driver.find_element(:css, "a.user_close_session").click
  end

end