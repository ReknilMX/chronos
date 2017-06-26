require "nomina_fiscal_spec_helper"

describe "WB.NF Login Administrador", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_administrador"

  it Time.now do
    assert element_present?(:link_text, "Comprobantes") == true
    assert element_present?(:link_text, "Empleados") == true
    assert element_present?(:link_text, "Datos de la empresa") == true
    assert element_present?(:link_text, "Actualizar dirección fiscal") == true
    assert element_present?(:link_text, "Certificados") == true
    assert element_present?(:link_text, "Actualizar cuenta") == true
    assert element_present?(:link_text, "Términos y condiciones") == true
    assert element_present?(:link_text, "Aviso de privacidad") == true
    assert element_present?(:link_text, "Soporte") == true
    assert element_present?(:link_text, "Tutorial") == true
    assert element_present?(:css, "a.user_close_session") == true
    assert element_present?(:id, "profile-image") == true
  end

end

describe "WB.NF Login Operador", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_operador"

  it Time.now do
    assert element_present?(:link_text, "Comprobantes") == true
    assert element_present?(:link_text, "Empleados") == false
    assert element_present?(:link_text, "Datos de la empresa") == true
    assert element_present?(:link_text, "Actualizar dirección fiscal") == true
    assert element_present?(:link_text, "Certificados") == true
    assert element_present?(:link_text, "Actualizar cuenta") == true
    assert element_present?(:link_text, "Términos y condiciones") == true
    assert element_present?(:link_text, "Aviso de privacidad") == true
    assert element_present?(:link_text, "Soporte") == true
    assert element_present?(:link_text, "Tutorial") == true
    assert element_present?(:css, "a.user_close_session") == true
    assert element_present?(:id, "profile-image") == true
  end

end

describe "WB.NF Login Empleado", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_empleado"

  it Time.now do
    assert element_present?(:link_text, "Comprobantes") == false
    assert element_present?(:link_text, "Empleados") == false
    assert element_present?(:link_text, "Datos de la empresa") == false
    assert element_present?(:link_text, "Actualizar dirección fiscal") == false
    assert element_present?(:link_text, "Certificados") == false
    assert element_present?(:link_text, "Actualizar cuenta") == true
    assert element_present?(:link_text, "Términos y condiciones") == true
    assert element_present?(:link_text, "Aviso de privacidad") == true
    assert element_present?(:link_text, "Soporte") == true
    assert element_present?(:link_text, "Tutorial") == true
    assert element_present?(:css, "a.user_close_session") == true
    assert element_present?(:id, "profile-image") == true
  end

end

describe "WB.NF Login Human Resources", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_recursos"

  it Time.now do
    assert element_present?(:link_text, "Comprobantes") == true
    assert element_present?(:link_text, "Empleados") == true
    assert element_present?(:link_text, "Datos de la empresa") == true
    assert element_present?(:link_text, "Actualizar dirección fiscal") == true
    assert element_present?(:link_text, "Certificados") == true
    assert element_present?(:link_text, "Actualizar cuenta") == true
    assert element_present?(:link_text, "Términos y condiciones") == true
    assert element_present?(:link_text, "Aviso de privacidad") == true
    assert element_present?(:link_text, "Soporte") == true
    assert element_present?(:link_text, "Tutorial") == true
    assert element_present?(:css, "a.user_close_session") == true
    assert element_present?(:id, "profile-image") == true
  end

end

describe "WB.NF Login Conector", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_conector"

  it Time.now do
    assert element_present?(:link_text, "Comprobantes") == true
    assert element_present?(:link_text, "Empleados") == false
    assert element_present?(:link_text, "Datos de la empresa") == true
    assert element_present?(:link_text, "Actualizar dirección fiscal") == true
    assert element_present?(:link_text, "Certificados") == true
    assert element_present?(:link_text, "Actualizar cuenta") == true
    assert element_present?(:link_text, "Términos y condiciones") == true
    assert element_present?(:link_text, "Aviso de privacidad") == true
    assert element_present?(:link_text, "Soporte") == true
    assert element_present?(:link_text, "Tutorial") == true
    assert element_present?(:css, "a.user_close_session") == true
    assert element_present?(:id, "profile-image") == true
  end

end

describe "WB.NF Login Timbre", :sauce => NFAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_timbre"

  it Time.now do
    assert element_present?(:link_text, "Comprobantes") == true
    assert element_present?(:link_text, "Empleados") == false
    assert element_present?(:link_text, "Datos de la empresa") == false
    assert element_present?(:link_text, "Actualizar dirección fiscal") == false
    assert element_present?(:link_text, "Certificados") == false
    assert element_present?(:link_text, "Actualizar cuenta") == true
    assert element_present?(:link_text, "Términos y condiciones") == true
    assert element_present?(:link_text, "Aviso de privacidad") == true
    assert element_present?(:link_text, "Soporte") == true
    assert element_present?(:link_text, "Tutorial") == true
    assert element_present?(:css, "a.user_close_session") == true
    assert element_present?(:id, "profile-image") == true
  end

end