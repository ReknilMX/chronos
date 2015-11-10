# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA - C7764 - Validar que campo Mes sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7764.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Mes' de la hoja Generales debe contener un valor"
  end

end

describe "WB.CONTA - C7765 - Validar que el campo Año sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7765.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Año' de la hoja Generales debe contener un valor"
  end

end

describe "WB.CONTA - C7766 - Validar que el campo Tipo de envío sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7766.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Tipo de Envío' de la hoja Generales debe contener un valor"
  end

end

describe "WB.CONTA - C7767 - Validar que el campo Fecha de Modificación de Balanza sea requerido cuando Tipo de Envio = C", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7767.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo FechaModificacion es requerido cuando el Tipo de Envio es C"
  end

end

describe "WB.CONTA - C7768 - Validar que el campo Numero de Cuenta sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7768.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo CuentasBalanza es requerido"
  end

end

describe "WB.CONTA - C7769 - Validar que el campo Saldo Inicial sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7769.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Saldo Inicial' de la hoja Balanza Cont debe contener un valor"
  end

end

describe "WB.CONTA - C7770 - Validar que el campo Debe sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7770.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Debe' de la hoja Balanza Cont debe contener un valor"
  end

end

describe "WB.CONTA - C7771 - Validar que el campo Haber sea requerido para el Archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7771.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Haber' de la hoja Balanza Cont debe contener un valor"
  end

end

describe "WB.CONTA - C7772 - Validar que el campo Saldo Final sea requerido para el Archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7772.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Saldo Final' de la hoja Balanza Cont debe contener un valor"
  end

end

describe "WB.CONTA - C7773 - Validar valores mayores a 13 en el campo Mes muestre mensaje para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7773.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Mes' con valor: 14 del archivo xlsx debe contar con la estructura definida por el SAT, los posibles valores van de 01 a 12 contenido en la hoja Generales"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Mes' con valor: 14/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe contar con la estructura definida por el SAT, los posibles valores van de 01 a 12/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
  end

end

describe "WB.CONTA - C7774 - Validar valores menores al 2015 en el campo Año para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7774.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Año' con valor: 2014 contenido en la hoja Generales del archivo xlsx debe contar con la estructura definida por el SAT, los posibles valores van de 2015 a 2099"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Año' con valor: 2014/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe contar con la estructura definida por el SAT, los posibles valores van de 2015 a 2099/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
  end

end

describe "WB.CONTA - C7775 - Validar con letras el campo Total de Cuentas para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7775.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo FechaModBal es inválido"
  end

end

describe "WB.CONTA - C7776 - Validar el campo Fecha de modificación de balanza con Letras para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7776.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Fecha Modificación de Balanza' con valor: DD/MM/AAAA contenido en la hoja Generales del archivo xlsx debe cumplir con el formato de fecha AAAA-MM-DD"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Fecha Modificación de Balanza' con valor: DD/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe cumplir con el formato de fecha AAAA-MM-DD/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
  end

end

describe "WB.CONTA - C7777 - Validar el campo Fecha de Modificación de Balanza con formatos diferentes a dd/mm/aa", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7777.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Fecha Modificación de Balanza' con valor: 2015/02/28 contenido en la hoja Generales del archivo xlsx debe cumplir con el formato de fecha AAAA-MM-DD"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Fecha Modificación de Balanza' con valor: 2015/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe cumplir con el formato de fecha AAAA-MM-DD/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
  end

end

describe "WB.CONTA - C7778 - Validar el campo Tipo de Envío con valores distintos a NC para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7778.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Tipo de Envío' con valor: X contenido en la hoja Generales del archivo xlsx Serie"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Tipo de Envío' con valor: X/
    assert @driver.element(:id => "flash-alert").text.should =~ /Serie/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
  end

end

describe "WB.CONTA - C7779 - Validar el campo Número de Cuenta con longitud mayor a 100 para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7779.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Número de Cuenta' con valor: 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890 del archivo xlsx debe ser alfanumérico con longitud de hasta 100 dígitos contenido en la hoja Balanza Cont"
  end

end

describe "WB.CONTA - C7780 - Validar el campo Saldo Inicial con letras para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7780.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Saldo Inicial' con valor: A1500 contenido en la hoja Balanza Cont del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Saldo Inicial' con valor: A1500/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Balanza Cont/
  end

end

describe "WB.CONTA - C7781 - Validar el campo Debe con letras para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7781.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Debe' con valor: A del archivo xlsx debe tener el formato decimal de importe contenido en la hoja Balanza Cont"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Debe' con valor: A/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Balanza Cont/
  end

end

describe "WB.CONTA - C7782 - Validar el campo Haber con letras para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7782.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Haber' con valor: A contenido en la hoja Balanza Cont del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Haber' con valor: A/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Balanza Cont/
  end

end

describe "WB.CONTA - C7783 - Validar el campo Saldo Final con letras para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7783.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Saldo Final' con valor: A1500 contenido en la hoja Balanza Cont del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Saldo Final' con valor: A1500/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Balanza Cont/
  end

end

describe "WB.CONTA - C7788 - Validar envío de archivo incompleto, sin una pestaña", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7788.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "La versión del archivo xlsx no es la esperada para el catálogo de Balanzas"
  end

end