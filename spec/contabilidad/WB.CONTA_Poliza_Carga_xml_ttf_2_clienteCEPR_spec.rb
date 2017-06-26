# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA - C7841 - Validar el campo CBB Número de Folio con letras para la sección CompNalOtr del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7841.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA: El campo CFD_CBB_NumFol debe ser un entero de hasta 20 dígitos"
  end

end

describe "WB.CONTA - C7842 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección CompNalOtr del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7842.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA: El campo RFC es demasiado corto (mínimo 12 caracteres)"
  end

end

describe "WB.CONTA - C7843 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección CompNalOtr del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7843.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA: El campo RFC no es válido\nError en línea 6 CompNalOtr LPSA: El campo RFC es demasiado largo (máximo 13 caracteres)"
  end

end

describe "WB.CONTA - C7845 - Validar el campo Monto con letras para la sección CompNalOtr del Archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7845.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA: El campo MontoTotal no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7846 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección CompNalOtr", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7846.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA: El campo Moneda no tiene un valor válido"
  end

end

describe "WB.CONTA - C7847 - Validar el campo Tipo de Cambio con letras para la sección CompNalOtr del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7847.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 6 CompNalOtr LPSA: El campo TipCamb no es válido, debe ser un importe positivo con fracción de hasta 5 decimales (99999999999999.99999)"
  end

end

describe "WB.CONTA - C7848 - Validar el campo Número con una longitud mayor a 36 de Comprobante Extranjero para la sección CompExt del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7848.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 7 CompExt d6a38a61de014922b78a01f7613b946aaaaa1234: El campo NumFactExt tiene una longitud errónea (debe ser de 36 caracteres)"
  end

end

describe "WB.CONTA - C7849 - Validar el campo TAx Id con una longitud mayor a 30 para la sección CompExt del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7849.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 7 CompExt d6a38a61de014922b78a01f7613b946aaaaa1234: El campo NumFactExt tiene una longitud errónea (debe ser de 36 caracteres)\nError en línea 7 CompExt d6a38a61de014922b78a01f7613b946aaaaa1234: El campo TaxID tiene una longitud errónea (debe ser mínimo de 1 carácter y máximo de 30 caracteres)"
  end

end

describe "WB.CONTA - C7850 - Validar el campo Monto con letras para la sección CompExt del Archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7850.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 7 CompExt d6a38a61de014922b78a01f7613b946aaaaa: El campo MontoTotal no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7851 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección CompExt", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7851.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 7 CompExt d6a38a61de014922b78a01f7613b946aaaaa: El campo Moneda no tiene un valor válido"
  end

end

describe "WB.CONTA - C7852 - Validar el campo Tipo de Cambio con letras para la sección CompExt del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7852.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 7 CompExt d6a38a61de014922b78a01f7613b946aaaaa: El campo TipCamb no es válido, debe ser un importe positivo con fracción de hasta 5 decimales (99999999999999.99999)"
  end

end

describe "WB.CONTA - C7853 - Validar el campo Número de Cheque con longitudes mayores a 20 para la sección Cheque del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7853.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 123456789012345678901: El campo Num tiene una longitud errónea (debe ser de 20 caracteres)"
  end

end

describe "WB.CONTA - C7854 - Validar el campo Banco Emisor Nal con valores distintos al catálogo del SAT para la sección de Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7854.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo BanEmisNal no tiene un valor válido"
  end

end

describe "WB.CONTA - C7855 - Validar el campo Banco Emisor Ext con una longitud mayor a 150 caracteres para la sección de Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7855.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo BanEmisExt tiene una longitud errónea (debe ser de 150 caracteres)"
  end

end

describe "WB.CONTA - C7856 - Validar el campo Cuenta Origen con una longitud mayor a 50 caracteres para la sección de Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7856.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo CtaOri tiene una longitud errónea (debe ser de 50 caracteres)"
  end

end

describe "WB.CONTA - C7857 - Validar el campo Fecha con letras y números para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7857.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8: El campo Fecha tiene un formato inválido (yyyy-mm-dd)"
  end

end

describe "WB.CONTA - C7858 - Validar el campo Beneficiario con una longitud mayor a 300 caracteres para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7858.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo Benef tiene una longitud errónea (debe ser de 300 caracteres)"
  end

end

describe "WB.CONTA - C7859 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7859.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo RFC es demasiado corto (mínimo 12 caracteres)"
  end

end

describe "WB.CONTA - C7860 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7860.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo RFC no es válido\nError en línea 8 Cheque 11: El campo RFC es demasiado largo (máximo 13 caracteres)"
  end

end

describe "WB.CONTA - C7861 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7861.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo Moneda no tiene un valor válido"
  end

end

describe "WB.CONTA - C7862 - Validar el campo Tipo de Cambio con letras para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7862.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 8 Cheque 11: El campo TipCamb no es válido, debe ser un importe positivo con fracción de hasta 5 decimales (99999999999999.99999)"
  end

end

describe "WB.CONTA - C7863 - Validar el Campo Cuenta Origen con una longitud mayor 50 para la sección de Transferencia del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7863.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 12345678901234567890123456789012345678901234567890123: El campo CtaOri tiene una longitud errónea (debe ser de 50 caracteres)"
  end

end

describe "WB.CONTA - C7864 - Validar el campo Banco Origen con valores distintor a los del catálogo definido por el SAT para la sección de Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7864.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo BancoOriNal no tiene un valor válido"
  end

end

describe "WB.CONTA - C7865 - Validar el campo Origen Extranjero con longitud mayor a 150 para la sección de Trasferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7865.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo BancoDestExt tiene una longitud errónea (debe ser de 150 caracteres)"
  end

end

describe "WB.CONTA - C7866 - Validar el campo Cuenta Destino con longitudes mayores a 50 para la sección de Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7866.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo CtaDest tiene una longitud errónea (debe ser de 50 caracteres)"
  end

end

describe "WB.CONTA - C7867 - Validar el campo Banco Destino Nacional con valores distintos a los del Catalogo del SAT", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7867.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo BancoDestNal no tiene un valor válido"
  end

end

describe "WB.CONTA - C7868 - Validar el campo Banco Destino Extranjero con longitud mayor a 150 para la sección de Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7868.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo Foreign destination bank tiene una longitud errónea (debe ser de 150 caracteres)"
  end

end

describe "WB.CONTA - C7869 - Validar el campo Fecha con letras y números para la sección de Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7869.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9: El campo Fecha tiene un formato inválido (yyyy-mm-dd)"
  end

end

describe "WB.CONTA - C7870 - Validar el campo Beneficiario con con longitudes mayores a 300 caracteres para la sección de Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7870.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo Benef tiene una longitud errónea (debe ser de 300 caracteres)"
  end

end

describe "WB.CONTA - C7871 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7871.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo RFC es demasiado corto (mínimo 12 caracteres)"
  end

end

describe "WB.CONTA - C7872 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7872.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo RFC no es válido\nError en línea 9 Transferencia 9382716273: El campo RFC es demasiado largo (máximo 13 caracteres)"
  end

end

describe "WB.CONTA - C7874 - Validar el campo Monto con letras para la sección Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7874.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo Monto no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7875 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7875.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo Moneda no tiene un valor válido"
  end

end

describe "WB.CONTA - C7876 - Validar el campo Tipo de Cambio con letras para la sección Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7876.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 9 Transferencia 9382716273: El campo TipCamb no es válido, debe ser un importe positivo con fracción de hasta 5 decimales (99999999999999.99999)"
  end

end

describe "WB.CONTA - C7877 - Validar el campo Método de Pago con valores distintos a los del catálogo definido por el SAT para la sección de OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7877.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10 OtrMetodoPago 25: El campo MetPagoPol no tiene un valor válido"
  end

end

describe "WB.CONTA - C7878 - Validar el campo Fecha con letras y números para la sección OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7878.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10: El campo Fecha tiene un formato inválido (yyyy-mm-dd)"
  end

end

describe "WB.CONTA - C7879 - Validar el campo Beneficiario con una longitud mayor a 300 caracteres para la sección OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7879.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10 OtrMetodoPago 01: El campo Benef tiene una longitud errónea (debe ser de 300 caracteres)"
  end

end

describe "WB.CONTA - C7880 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7880.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10 OtrMetodoPago 01: El campo RFC es demasiado corto (mínimo 12 caracteres)"
  end

end

describe "WB.CONTA - C7881 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección OtrMetodopago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7881.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10 OtrMetodoPago 01: El campo RFC no es válido\nError en línea 10 OtrMetodoPago 01: El campo RFC es demasiado largo (máximo 13 caracteres)"
  end

end

describe "WB.CONTA - C7883 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7883.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10 OtrMetodoPago 01: El campo Moneda no tiene un valor válido"
  end

end

describe "WB.CONTA - C7884 - Validar el campo Tipo de Cambio con letras para la sección OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7884.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 10 OtrMetodoPago 01: El campo TipCamb no es válido, debe ser un importe positivo con fracción de hasta 5 decimales (99999999999999.99999)"
  end

end

describe "WB.CONTA - C7885 - Validar el campo Numero de Cuenta con longitudes mayores a 100 caracteres de la sección de Transacciones", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7885.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 4 Transaccion con número de cuenta 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123: El campo NumCta tiene una longitud errónea (debe ser de 100 caracteres)"
  end

end

describe "WB.CONTA - C7886 - Validar el campo Descripción de la Cuenta con longitudes mayores a 100 caracteres de la sección de Transacciones", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7886.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 4 Transaccion con número de cuenta AABH631101U83: El campo DesCta tiene una longitud errónea (debe ser de 100 caracteres)"
  end

end

describe "WB.CONTA - C7887 - Validar el campo Concepto de la Cuenta con longitudes mayores a 200 caracteres de la sección de Transacciones", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7887.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 4 Transaccion con número de cuenta AABH631101U83: El campo Concepto tiene una longitud errónea (debe ser de 200 caracteres)"
  end

end

describe "WB.CONTA - C7888 - Validar con letras el campo Debe para la sección de Transacciones", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7888.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 4 Transaccion con número de cuenta AABH631101U83: El campo Debe no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7889 - Validar con letras el campo Haber para la sección de Transacciones", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7889.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 4 Transaccion con número de cuenta AABH631101U83: El campo Haber no es válido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end