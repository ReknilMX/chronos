# encoding: utf-8

require "nomina_fiscal_spec_helper"

describe "WB.NF.EM Invitar", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_recursos"

  it Time.now do
    @driver.find_element(:link_text, "EMPLEADOS").click
    until @driver.find_element(:class, "invitacion-empleado").present? == true do
          if element_present?(:class_name, "invitacion-empleado") == true
              @driver.find_element(:class, "invitacion-empleado").click
              @driver.find_element(:id, "employee_user_form_username_employee").click
              @driver.action.double_click(@driver.find_element(:id, "employee_user_form_username_employee")).perform
              @driver.action.key_down(:command).send_keys("a").key_up(:command).perform
              @driver.action.key_down(:command).send_keys("c").key_up(:command).perform
              @driver.find_element(:id, "employee_user_form_password").click
              @driver.action.key_down(:command).send_keys("v").key_up(:command).perform
              @driver.find_element(:id, "employee_user_form_password").send_keys "a"
              @driver.find_element(:name, "button").click
              @driver.find_element(:link_text, "regresar a empleados").click
          else 
              @driver.find_element(:link_text, "Siguiente").click
          end
    end
  end
end