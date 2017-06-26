# encoding: utf-8

require "nomina_fiscal_spec_helper"

describe "WB.NF.Com Busqueda RFC Administrador", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"

  it Time.now do
    @driver.find_element(:link_text, "Comprobantes").click
    sleep(5.seconds)
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_2i")).select_by(:text, "enero")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_1i")).select_by(:text, "2015")
    @driver.find_element(:id, "q_rfc_receiver_or_payroll_complement_employee_number_or_razon_social_receiver_or_payroll_complement_department_or_payroll_complement_curp_cont").send_keys "TEST010101N01"
    @driver.find_element(:name, "button").click
    sleep(5.seconds)
    assert @driver.find_element(:id, "total_periods").text.should =~ /1/
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF.Com Busqueda RFC Operador", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_operador"

  it Time.now do
    @driver.find_element(:link_text, "Comprobantes").click
    sleep(5.seconds)
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_2i")).select_by(:text, "enero")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_1i")).select_by(:text, "2015")
    @driver.find_element(:id, "q_rfc_receiver_or_payroll_complement_employee_number_or_razon_social_receiver_or_payroll_complement_department_or_payroll_complement_curp_cont").send_keys "TEST010101N01"
    @driver.find_element(:name, "button").click
    sleep(5.seconds)
    assert @driver.find_element(:id, "total_periods").text.should =~ /1/
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF.Com Busqueda RFC Human Resources", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_recursos"

  it Time.now do
    @driver.find_element(:link_text, "Comprobantes").click
    sleep(5.seconds)
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_2i")).select_by(:text, "enero")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_1i")).select_by(:text, "2015")
    @driver.find_element(:id, "q_rfc_receiver_or_payroll_complement_employee_number_or_razon_social_receiver_or_payroll_complement_department_or_payroll_complement_curp_cont").send_keys "TEST010101N01"
    @driver.find_element(:name, "button").click
    sleep(5.seconds)
    assert @driver.find_element(:id, "total_periods").text.should =~ /1/
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF.Com Busqueda RFC Conector", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_conector"

  it Time.now do
    @driver.find_element(:link_text, "Comprobantes").click
    sleep(5.seconds)
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_2i")).select_by(:text, "enero")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_1i")).select_by(:text, "2015")
    @driver.find_element(:id, "q_rfc_receiver_or_payroll_complement_employee_number_or_razon_social_receiver_or_payroll_complement_department_or_payroll_complement_curp_cont").send_keys "TEST010101N01"
    @driver.find_element(:name, "button").click
    sleep(5.seconds)
    assert @driver.find_element(:id, "total_periods").text.should =~ /1/
    @driver.find_element(:css, "a.user_close_session").click
  end

end

describe "WB.NF.Com Busqueda RFC Timbre", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_timbre"

  it Time.now do
    @driver.find_element(:link_text, "Comprobantes").click
    sleep(5.seconds)
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_2i")).select_by(:text, "enero")
    Selenium::WebDriver::Support::Select.new(@driver.find_element(:id, "q_payroll_complement_payment_start_date_lteq_1i")).select_by(:text, "2015")
    @driver.find_element(:id, "q_rfc_receiver_or_payroll_complement_employee_number_or_razon_social_receiver_or_payroll_complement_department_or_payroll_complement_curp_cont").send_keys "TEST010101N01"
    @driver.find_element(:name, "button").click
    sleep(5.seconds)
    assert @driver.find_element(:id, "total_periods").text.should =~ /1/
    @driver.find_element(:css, "a.user_close_session").click
  end

end