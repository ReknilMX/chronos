# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA - C7790 - Validar que campo Mes sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7790.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Mes debe contener un valor\nError en línea 2: El campo Mes no es un número"
  end

end

describe "WB.CONTA - C7791 - Validar que el campo Año sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7791.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Anio debe contener un valor\nError en línea 2: El campo Anio no es un número"
  end

end

describe "WB.CONTA - C7792 - Validar el campo Tipo de Solicitud sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7792.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo TipoSolicitud debe contener un valor\nError en línea 2: El campo TipoSolicitud no tiene un valor válido (Valores válidos AF, FC, DE y CO)"
  end

end

describe "WB.CONTA - C7793 - Validar que el campo Numero de Orden sea requerido cuando el campo Tipo de Solicitud sea AF", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7793.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo NumOrden debe contener un valor cuando TipoSolicitud sea igual a AF o FC"
  end

end

describe "WB.CONTA - C7794 - Validar que el campo Numero de Orden sea requerido cuando el campo Tipo de Solicitud sea FC", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7794.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo NumOrden debe contener un valor cuando TipoSolicitud sea igual a AF o FC"
  end

end

describe "WB.CONTA - C7795 - Validar que el campo NumTramite sea requerido cuando el Tipo de Solicitud sea DE", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7795.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo NumTramite debe contener un valor cuando TipoSolicitud sea igual a DE o CO"
  end

end

describe "WB.CONTA - C7796 - Validar que el campo NumTramite sea requerido cuando el Tipo de Solicitud sea CO", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7796.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo NumTramite debe contener un valor cuando TipoSolicitud sea igual a DE o CO"
  end

end

describe "WB.CONTA - C7797 - Validar que el campo UUID de la sección CompNal sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7797.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 5 CompNal : El campo UUID_CFDI debe contener un valor\nError en línea 5 CompNal : El campo UUID_CFDI tiene una longitud errónea (debe ser de 36 caracteres)\nError en línea 5 CompNal : El campo UUID_CFDI no es válido"
  end

end

describe "WB.CONTA - C7798 - Validar que el campo RFC de la sección CompNal sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7798.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo RFC debe contener un valor\nError en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo RFC no es válido\nError en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo RFC es demasiado corto (mínimo 12 caracteres)"
  end

end

describe "WB.CONTA - C7799 - Validar que el campo Monto de la sección CompNal sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7799.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo MontoTotal debe contener un valor\nError en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo MontoTotal no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7800 - Validar que el campo CCB Número de Folio de la sección CompNalOtr sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7800.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA: El campo CFD_CBB_NumFol debe contener un valor\nError en línea 6 CompNalOtr LPSA: El campo CFD_CBB_NumFol debe ser un entero de hasta 20 dígitos"
  end

end

describe "WB.CONTA - C7801 - Validar que el campo RFC de la sección CompNalOtr sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7801.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA: El campo RFC debe contener un valor\nError en línea 6 CompNalOtr LPSA: El campo RFC no es válido\nError en línea 6 CompNalOtr LPSA: El campo RFC es demasiado corto (mínimo 12 caracteres)"
  end

end

describe "WB.CONTA - C7802 - Validar que el campo Monto de la sección CompNalOtr sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7802.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA: El campo MontoTotal debe contener un valor\nError en línea 6 CompNalOtr LPSA: El campo MontoTotal no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7803 - Validar que el campo Numero de Comprobante Extranjero de la sección CompExt sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7803.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 7 CompExt : El campo NumFactExt debe contener un valor"
  end

end

describe "WB.CONTA - C7804 - Validar que el campo Monto de la sección CompExt sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7804.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 7 CompExt d6a38a61de014922b78a01f7613b946aaaaa: El campo MontoTotal debe contener un valor\nError en línea 7 CompExt d6a38a61de014922b78a01f7613b946aaaaa: El campo MontoTotal no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7805 - Validar que el campo Número de Cheque de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7805.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque : El campo Num debe contener un valor"
  end

end

describe "WB.CONTA - C7806 - Validar que el campo Banco Emisor Nal de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7806.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo BanEmisNal debe contener un valor\nError en línea 8 Cheque 11: El campo BanEmisNal no tiene un valor válido"
  end

end

describe "WB.CONTA - C7807 - Validar que el campo Cuenta Origen de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7807.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo CtaOri debe contener un valor"
  end

end

describe "WB.CONTA - C7808 - Validar que el campo Fecha de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7808.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8: El campo Fecha tiene un formato inválido (yyyy-mm-dd)"
  end

end

describe "WB.CONTA - C7809 - Validar que el campo Beneficiario de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7809.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo Benef debe contener un valor"
  end

end

describe "WB.CONTA - C7810 - Validar que el campo RFC de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7810.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo RFC debe contener un valor\nError en línea 8 Cheque 11: El campo RFC no es válido\nError en línea 8 Cheque 11: El campo RFC es demasiado corto (mínimo 12 caracteres)"
  end

end

describe "WB.CONTA - C7811 - Validar que el campo Monto de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7811.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo Monto debe contener un valor\nError en línea 8 Cheque 11: El campo Monto no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7812 - Validar que el campo Banco Origen Nacional de la sección Transferencia sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7812.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo BancoOriNal debe contener un valor\nError en línea 9 Transferencia 9382716273: El campo BancoOriNal no tiene un valor válido"
  end

end

describe "WB.CONTA - C7813 - Validar que el campo Cuenta destino de la sección Transferencia sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7813.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo CtaDest debe contener un valor"
  end

end

describe "WB.CONTA - C7814 - Validar que el campo Banco Destino Nacional de la sección de Transferencia sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7814.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo BancoDestNal debe contener un valor\nError en línea 9 Transferencia 9382716273: El campo BancoDestNal no tiene un valor válido"
  end

end

describe "WB.CONTA - C7815 - Validar que el campo Fecha de la sección de Transferencia sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7815.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9: El campo Fecha tiene un formato inválido (yyyy-mm-dd)"
  end

end

describe "WB.CONTA - C7816 - Validar que el campo Beneficiario de la sección de Transferencia sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7816.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo Benef debe contener un valor"
  end

end

describe "WB.CONTA - C7817 - Validar que el campo RFC de la sección de Transferencia sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7817.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo RFC debe contener un valor\nError en línea 9 Transferencia 9382716273: El campo RFC no es válido\nError en línea 9 Transferencia 9382716273: El campo RFC es demasiado corto (mínimo 12 caracteres)"
  end

end

describe "WB.CONTA - C7818 - Validar que el campo Monto de la sección de Transferencia sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7818.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo Monto debe contener un valor\nError en línea 9 Transferencia 9382716273: El campo Monto no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7819 - Validar que el campo Método de Pago de la sección de Otro Método de Pago sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7819.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10 OtrMetodoPago : El campo MetPagoPol debe contener un valor\nError en línea 10 OtrMetodoPago : El campo MetPagoPol no tiene un valor válido"
  end

end

describe "WB.CONTA - C7820 - Validar que el campo Fecha de la sección Otro Método de Pago sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7820.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10: El campo Fecha tiene un formato inválido (yyyy-mm-dd)"
  end

end

describe "WB.CONTA - C7821 - Validar que el campo Beneficiario de la sección Otro Método de Pago sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7821.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10 OtrMetodoPago 01: El campo Benef debe contener un valor"
  end

end

describe "WB.CONTA - C7822 - Validar que el campo RFC de la sección Otro Método de Pago sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7822.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10 OtrMetodoPago 01: El campo RFC debe contener un valor\nError en línea 10 OtrMetodoPago 01: El campo RFC no es válido\nError en línea 10 OtrMetodoPago 01: El campo RFC es demasiado corto (mínimo 12 caracteres)"
  end

end

describe "WB.CONTA - C7823 - Validar que el campo Monto de la sección Otro Método de Pago sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7823.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10 OtrMetodoPago 01: El campo Monto debe contener un valor\nError en línea 10 OtrMetodoPago 01: El campo Monto no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7824 - Validar que el campo mes con valores mayores a 12 para la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7824.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Mes debe ser mayor a 0 y menor a 13"
  end

end

describe "WB.CONTA - C7825 - Valiadar el campo año con valores menores a 2015 en la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7825.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Anio debe ser mayor a 2014 y menor a 2100"
  end

end

describe "WB.CONTA - C7826 - Validar que el campo Tipo de Solicitud con valores distintos a AF|FC|DE|CO para la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7826.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo TipoSolicitud no tiene un valor válido (Valores válidos AF, FC, DE y CO)"
  end

end

describe "WB.CONTA - C7827 - Validar el campo Número de Orden con una longitud mayor a 13 caracteres para la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7827.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo NumOrden tiene una longitud errónea (debe ser de 13 caracteres)\nError en línea 2: El campo NumOrden no tiene un formato válido"
  end

end

describe "WB.CONTA - C7828 - Validar el campo Numero de Orden con caracteres especiales para la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7828.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo NumOrden no tiene un formato válido"
  end

end

describe "WB.CONTA - C7829 - Validar el campo Número de Trámite con longitud mayor a 10 para la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7829.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo NumTramite tiene una longitud errónea (debe ser de 10 caracteres)\nError en línea 2: El campo NumTramite no tiene un formato válido"
  end

end

describe "WB.CONTA - C7830 - Validar el campo UUID con una longitud mayor a 36 caracteres para la sección de CompNal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7830.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b281: El campo UUID_CFDI tiene una longitud errónea (debe ser de 36 caracteres)\nError en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b281: El campo UUID_CFDI no es válido"
  end

end

describe "WB.CONTA - C7831 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección CompNal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7831.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo RFC no es válido\nError en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo RFC es demasiado largo (máximo 13 caracteres)"
  end

end

describe "WB.CONTA - C7832 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección CompNal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7832.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo RFC es demasiado corto (mínimo 12 caracteres)"
  end

end

describe "WB.CONTA - C7834 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección CompNal", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7834.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo Moneda no tiene un valor válido"
  end

end

describe "WB.CONTA - C7835 - Validar el campo Monto con letras para la sección CompNal del Archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7835.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo MontoTotal no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7836 - Validar el campo Tipo de Cambio con letras para la sección Comp Nal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7836.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo TipCamb no es válido, debe ser un importe positivo con fracción de hasta 5 decimales (99999999999999.99999)"
  end

end

describe "WB.CONTA - C7837 - Validar el campo con cantidades mayores a 20 digitos y 6 decimales para la sección Comp Nal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7837.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 5 CompNal e1a15bc8-de01-4101-8538-2a18ecb33b28: El campo MontoTotal no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7838 - Validar el campo CBB- Serie con una longitud mayor a 10 para al sección de CompNalOtr de la sección de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7838.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA1234567: El campo CFD_CBB_Serie tiene una longitud errónea (debe ser de 10 caracteres)\nError en línea 6 CompNalOtr LPSA1234567: El campo CFD_CBB_Serie no tiene un valor válido"
  end

end

describe "WB.CONTA - C7839 - Validar el campo CBB-Folio con letras para la sección CompNalOtr de la sección Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7839.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA: El campo CFD_CBB_NumFol debe ser un entero de hasta 20 dígitos"
  end

end

describe "WB.CONTA - C7840 - Validar el campo CBB Número de Folio con una longitud mayor a 20 para la sección CompNal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7840.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA: El campo CFD_CBB_NumFol debe ser un entero de hasta 20 dígitos"
  end

end