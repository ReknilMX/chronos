# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA - C7841 - Validar el campo CBB Número de Folio con letras para la sección CompNalOtr del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7841.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'CBB Número de Folio' con valor: AAA contenido en la hoja CompNalOtr del archivo xlsx Debe ser numérico con una longitud máxima de 20 dígitos"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'CBB Número de Folio' con valor: AAA/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser numérico con una longitud máxima de 20 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNalOtr/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7842 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección CompNalOtr del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7842.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'RFC' con valor: AABH631101U del archivo xlsx debe ser un RFC válido para persona física o moral contenido en la hoja CompNalOtr"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'RFC' con valor: AABH631101U/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un RFC válido para persona física o moral/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNalOtr/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7843 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección CompNalOtr del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7843.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'RFC' con valor: AABH631101U831 contenido en la hoja CompNalOtr del archivo xlsx debe ser un RFC válido para persona física o moral"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'RFC' con valor: AABH631101U831/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un RFC válido para persona física o moral/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNalOtr/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7845 - Validar el campo Monto con letras para la sección CompNalOtr del Archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7845.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Monto' con valor: AAA contenido en la hoja CompNalOtr del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Monto' con valor: AAA/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNalOtr/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7846 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección CompNalOtr", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7846.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Moneda' con valor: XYZ contenido en la hoja CompNalOtr del archivo xlsx debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos."
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Moneda' con valor: XYZ/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos./
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNalOtr/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7847 - Validar el campo Tipo de Cambio con letras para la sección CompNalOtr del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7847.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Tipo de Cambio' con valor: A contenido en la hoja CompNal del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Tipo de Cambio' con valor: A/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNalOtr/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7848 - Validar el campo Número con una longitud mayor a 36 de Comprobante Extranjero para la sección CompExt del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7848.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Número de Comprobante Extranjero' con valor: d6a38a61de014922b78a01f7613b946aaaaa1234 del archivo xlsx debe ser alfanumérico con longitud de hasta 36 dígitos contenido en la hoja CompExt"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Número de Comprobante Extranjero' con valor: d6a38a61de014922b78a01f7613b946aaaaa1234/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser alfanumérico con longitud de hasta 36 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompExt/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7849 - Validar el campo TAx Id con una longitud mayor a 30 para la sección CompExt del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7849.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Tax ID' con valor: 8UJ89PERJ4901236H71234567890123 contenido en la hoja CompExt del archivo xlsx debe tener una longitud máxima de 30 caracteres"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Tax ID' con valor: 8UJ89PERJ4901236H71234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener una longitud máxima de 30 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompExt/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7850 - Validar el campo Monto con letras para la sección CompExt del Archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7850.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Monto' con valor: AAA contenido en la hoja CompExt del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Monto' con valor: AAA/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompExt/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7851 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección CompExt", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7851.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Moneda' con valor: XYZ contenido en la hoja CompExt del archivo xlsx debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos."
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Moneda' con valor: XYZ/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos./
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompExt/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7852 - Validar el campo Tipo de Cambio con letras para la sección CompExt del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7852.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Tipo de Cambio' con valor: strconv.ParseFloat: parsing \"A\": invalid syntax del archivo xlsx debe tener el formato decimal de importe contenido en la hoja CompExt"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Tipo de Cambio' con valor: A/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompExt/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7853 - Validar el campo Número de Cheque con longitudes mayores a 20 para la sección Cheque del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7853.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Número Cheque' con valor: 123456789012345678901 del archivo xlsx debe ser alfanumérico con longitud de hasta 20 dígitos contenido en la hoja Cheque"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Número Cheque' con valor: 123456789012345678901/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser alfanumérico con longitud de hasta 20 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Cheque/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7854 - Validar el campo Banco Emisor Nal con valores distintos al catálogo del SAT para la sección de Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7854.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Banco Emisor Nal' con valor: 998 contenido en la hoja Cheque del archivo xlsx debe ser un Código de Banco válido"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Banco Emisor Nal' con valor: 998/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un Código de Banco válido/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Cheque/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7855 - Validar el campo Banco Emisor Ext con una longitud mayor a 150 caracteres para la sección de Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7855.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Banco Emisor Ext' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 contenido en la hoja Cheque del archivo xlsx debe tener una longitud máxima de 150 caracteres"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Banco Emisor Ext' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener una longitud máxima de 150 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Cheque/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7856 - Validar el campo Cuenta Origen con una longitud mayor a 50 caracteres para la sección de Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7856.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Cuenta Origen' con valor: 12345678901234567890123456789012345678901234567890123 del archivo xlsx debe ser alfanumérico con longitud de hasta 50 dígitos contenido en la hoja Transferencia"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Cuenta Origen' con valor: 12345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser alfanumérico con longitud de hasta 50 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Cheque/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7857 - Validar el campo Fecha con letras y números para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7857.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Fecha' con valor: 10/MM/2014 contenido en la hoja Cheque del archivo xlsx debe cumplir con el formato de fecha AAAA-MM-DD"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Fecha' con valor:/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe cumplir con el formato de fecha AAAA-MM-DD/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Cheque/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7858 - Validar el campo Beneficiario con una longitud mayor a 300 caracteres para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7858.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Beneficiario' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 contenido en la hoja Cheque del archivo xlsx debe tener una longitud máxima de 300 caracteres"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Beneficiario' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener una longitud máxima de 300 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Cheque/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7859 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7859.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'RFC' con valor: HERI801025L del archivo xlsx debe ser un RFC válido para persona física o moral contenido en la hoja Cheque"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'RFC' con valor: HERI801025L/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un RFC válido para persona física o moral/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Cheque/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7860 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7860.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'RFC' con valor: HERI801025LG81 contenido en la hoja Cheque del archivo xlsx debe ser un RFC válido para persona física o moral"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'RFC' con valor: HERI801025LG81/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un RFC válido para persona física o moral/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Cheque/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7861 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7861.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Moneda' con valor: XYZ contenido en la hoja CompExt del archivo xlsx debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos."
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Moneda' con valor: XYZ/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos./
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Cheque/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7862 - Validar el campo Tipo de Cambio con letras para la sección Cheque", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7862.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Tipo de Cambio' con valor: A del archivo xlsx debe tener el formato decimal de importe contenido en la hoja Cheque"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Tipo de Cambio' con valor: A/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Cheque/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7863 - Validar el Campo Cuenta Origen con una longitud mayor 50 para la sección de Transferencia del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7863.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Cuenta Origen' con valor: 12345678901234567890123456789012345678901234567890123 contenido en la hoja Transferencia del archivo xlsx debe ser alfanumérico con longitud de hasta 50 dígitos"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Cuenta Origen' con valor: 12345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser alfanumérico con longitud de hasta 50 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser alfanumérico con longitud de hasta 50 dígitos/
  end

end

describe "WB.CONTA - C7864 - Validar el campo Banco Origen con valores distintor a los del catálogo definido por el SAT para la sección de Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7864.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Banco Origen' con valor: 998 contenido en la hoja Transferencia del archivo xlsx debe ser un Código de Banco válido"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Banco Origen' con valor: 998/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un Código de Banco válido/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7865 - Validar el campo Origen Extranjero con longitud mayor a 150 para la sección de Trasferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7865.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Banco Origen Ext' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 contenido en la hoja Transferencia del archivo xlsx debe tener una longitud máxima de 150 caracteres"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Banco Origen Ext' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener una longitud máxima de 150 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7866 - Validar el campo Cuenta Destino con longitudes mayores a 50 para la sección de Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7866.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Cuenta Destino' con valor: 12345678901234567890123456789012345678901234567890123 contenido en la hoja Transferencia del archivo xlsx debe ser alfanumérico con longitud de hasta 50 dígitos"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Cuenta Destino' con valor: 12345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser alfanumérico con longitud de hasta 50 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7867 - Validar el campo Banco Destino Nacional con valores distintos a los del Catalogo del SAT", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7867.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Banco Destino' con valor: 998 contenido en la hoja Transferencia del archivo xlsx debe ser un Código de Banco válido"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Banco Destino' con valor: 998/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un Código de Banco válido/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7868 - Validar el campo Banco Destino Extranjero con longitud mayor a 150 para la sección de Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7868.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Banco Destino Ext' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 contenido en la hoja Transferencia del archivo xlsx debe tener una longitud máxima de 150 caracteres"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Banco Destino Ext' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener una longitud máxima de 150 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7869 - Validar el campo Fecha con letras y números para la sección de Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7869.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Fecha' con valor: 10/MM/2014 contenido en la hoja Transferencia del archivo xlsx debe cumplir con el formato de fecha AAAA-MM-DD"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Fecha' con valor: 10/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe cumplir con el formato de fecha AAAA-MM-DD/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7870 - Validar el campo Beneficiario con con longitudes mayores a 300 caracteres para la sección de Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7870.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Beneficiario' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 contenido en la hoja Transferencia del archivo xlsx debe tener una longitud máxima de 300 caracteres"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Beneficiario' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener una longitud máxima de 300 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7871 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7871.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'RFC' con valor: PEMÑ880216R contenido en la hoja Transferencia del archivo xlsx debe ser un RFC válido para persona física o moral"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'RFC' con valor: PEMÑ880216R/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un RFC válido para persona física o moral/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7872 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7872.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'RFC' con valor: PEMÑ880216RW31 contenido en la hoja Transferencia del archivo xlsx debe ser un RFC válido para persona física o moral"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'RFC' con valor: PEMÑ880216RW31/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un RFC válido para persona física o moral/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7874 - Validar el campo Monto con letras para la sección Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7874.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Monto' con valor: AAA contenido en la hoja Transferencia del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Monto' con valor: AAA/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7875 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7875.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Moneda' con valor: XYZ contenido en la hoja Transferencia del archivo xlsx debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos."
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Moneda' con valor: XYZ/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos./
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7876 - Validar el campo Tipo de Cambio con letras para la sección Transferencia", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7876.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Tipo de Cambio' con valor: A contenido en la hoja Transferencia del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Tipo de Cambio' con valor: A/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transferencia/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7877 - Validar el campo Método de Pago con valores distintos a los del catálogo definido por el SAT para la sección de OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7877.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Método de Pago' con valor: 25 contenido en la hoja OtrMetodoPago del archivo xlsx debe ser un valor de Método de Pago válido"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Método de Pago' con valor: 25/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un valor de Método de Pago válido/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja OtrMetodoPago/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7878 - Validar el campo Fecha con letras y números para la sección OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7878.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Fecha' con valor: DD/02/2014 contenido en la hoja OtrMetodoPago del archivo xlsx debe cumplir con el formato de fecha AAAA-MM-DD"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Fecha' con valor: DD/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe cumplir con el formato de fecha AAAA-MM-DD/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja OtrMetodoPago/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7879 - Validar el campo Beneficiario con una longitud mayor a 300 caracteres para la sección OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7879.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Beneficiario' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 del archivo xlsx debe tener una longitud máxima de 300 caracteres contenido en la hoja OtrMetodoPago"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Beneficiario' con valor: 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener una longitud máxima de 300 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja OtrMetodoPago/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7880 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7880.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'RFC' con valor: ORHA100325S del archivo xlsx debe ser un RFC válido para persona física o moral contenido en la hoja OtrMetodoPago"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'RFC' con valor: ORHA100325S/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un RFC válido para persona física o moral/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja OtrMetodoPago/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7881 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección OtrMetodopago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7881.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'RFC' con valor: ORHA100325SY11 del archivo xlsx debe ser un RFC válido para persona física o moral contenido en la hoja OtrMetodoPago"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'RFC' con valor: ORHA100325SY11/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un RFC válido para persona física o moral/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja OtrMetodoPago/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7883 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7883.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Moneda' con valor: XYZ del archivo xlsx debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos. contenido en la hoja OtrMetodoPago"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Moneda' con valor: XYZ/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos./
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja OtrMetodoPago/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7884 - Validar el campo Tipo de Cambio con letras para la sección OtrMetodoPago", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7884.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Tipo de Cambio' con valor: A contenido en la hoja OtrMetodoPago del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Tipo de Cambio' con valor: A/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja OtrMetodoPago/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7885 - Validar el campo Numero de Cuenta con longitudes mayores a 100 caracteres de la sección de Transacciones", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7885.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Número Cuenta' con valor: 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 contenido en la hoja Transacciones del archivo xlsx debe ser alfanumérico con longitud de hasta 100 dígitos"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Número Cuenta' con valor: 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser alfanumérico con longitud de hasta 100 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transacciones/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7886 - Validar el campo Descripción de la Cuenta con longitudes mayores a 100 caracteres de la sección de Transacciones", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7886.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Descripción Cuenta' con valor: 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 contenido en la hoja Transacciones del archivo xlsx debe tener una longitud máxima de 100 caracteres"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Descripción Cuenta' con valor: 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener una longitud máxima de 100 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transacciones/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7887 - Validar el campo Concepto de la Cuenta con longitudes mayores a 200 caracteres de la sección de Transacciones", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7887.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Concepto' con valor: 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 del archivo xlsx debe tener una longitud máxima de 200 caracteres"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Concepto' con valor: 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener una longitud máxima de 200 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transacciones/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7888 - Validar con letras el campo Debe para la sección de Transacciones", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7888.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Debe' con valor: A contenido en la hoja Transacciones del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Debe' con valor: A/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transacciones/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7889 - Validar con letras el campo Haber para la sección de Transacciones", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7889.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Haber' con valor: A contenido en la hoja Transacciones del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Haber' con valor: A/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Transacciones/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end