# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA - C7764 - Validar que campo Mes sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7764.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Mes debe contener un valor\nError en línea 2: El campo Mes no es un número"
  end

end

describe "WB.CONTA - C7765 - Validar que el campo Año sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7765.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Anio debe contener un valor\nError en línea 2: El campo Anio no es un número"
  end

end

describe "WB.CONTA - C7766 - Validar que el campo Tipo de envío sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7766.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo TipoEnvio debe contener un valor\nError en línea 2: El campo TipoEnvio no tiene un valor válido (Valores válidos N y C)"
  end

end

describe "WB.CONTA - C7767 - Validar que el campo Fecha de Modificación de Balanza sea requerido cuando Tipo de Envio = C", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7767.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo FechaModBal debe contener un valor cuando el tipo de envío es C"
  end

end

describe "WB.CONTA - C7768 - Validar que el campo Numero de Cuenta sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7768.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta : El campo NumCta debe contener un valor"
  end

end

describe "WB.CONTA - C7769 - Validar que el campo Saldo Inicial sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7769.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta 1000101: El campo SaldoIni debe contener un valor\nError en línea 3 Cta 1000101: El campo SaldoIni es inválido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7770 - Validar que el campo Debe sea requerido para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7770.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta 1000101: El campo Debe debe contener un valor\nError en línea 3 Cta 1000101: El campo Debe es inválido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7771 - Validar que el campo Haber sea requerido para el Archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7771.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta 1000101: El campo Haber debe contener un valor\nError en línea 3 Cta 1000101: El campo Haber es inválido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7772 - Validar que el campo Saldo Final sea requerido para el Archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7772.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta 1000101: El campo SaldoFin debe contener un valor\nError en línea 3 Cta 1000101: El campo SaldoFin es inválido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7773 - Validar valores mayores a 13 en el campo Mes muestre mensaje para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7773.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Mes debe ser mayor a 0 y menor a 13"
  end

end

describe "WB.CONTA - C7774 - Validar valores menores al 2015 en el campo Año para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7774.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Anio debe ser mayor a 2014 y menor a 2100"
  end

end

describe "WB.CONTA - C7776 - Validar el campo Fecha de modificación de balanza con Letras para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7776.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo FechaModBal el formato no es válido"
  end

end

describe "WB.CONTA - C7777 - Validar el campo Fecha de Modificación de Balanza con formatos diferentes a dd/mm/aa", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7777.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo FechaModBal el formato no es válido"
  end

end

describe "WB.CONTA - C7778 - Validar el campo Tipo de Envío con valores distintos a NC para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7778.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo TipoEnvio no tiene un valor válido (Valores válidos N y C)"
  end

end

describe "WB.CONTA - C7779 - Validar el campo Número de Cuenta con longitud mayor a 100 para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7779.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901: El campo NumCta es demasiado largo (máximo 100 caracteres)"
  end

end

describe "WB.CONTA - C7780 - Validar el campo Saldo Inicial con letras para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7780.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta 1000101: El campo SaldoIni es inválido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7781 - Validar el campo Debe con letras para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7781.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta 1000101: El campo Debe es inválido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7782 - Validar el campo Haber con letras para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7782.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta 1000101: El campo Haber es inválido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7783 - Validar el campo Saldo Final con letras para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7783.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta 1000101: El campo SaldoFin es inválido, debe ser un importe numérico con fracción de hasta 2 decimales (-99999999999999.99 - 99999999999999.99)"
  end

end

describe "WB.CONTA - C7784 - Validar RFC con logitud menor a 12 caracteres para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7784.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo RFC es demasiado corto (mínimo 12 caracteres)\nError en línea 2: El campo RFC no coincide con el rfc de la empresa actual"
  end

end

describe "WB.CONTA - C7785 - Validar RFC con longitud mayor a 13 caracteres para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7785.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo RFC no es válido\nError en línea 2: El campo RFC es demasiado largo (máximo 13 caracteres)\nError en línea 2: El campo RFC no coincide con el rfc de la empresa actual"
  end

end

describe "WB.CONTA - C7786 - Validar RFC con &, Ñ para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7786.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo RFC no coincide con el rfc de la empresa actual"
  end

end

describe "WB.CONTA - C7787 - Validar Numero de certificado mayor a 20 caracteres para el archivo de Balanza", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Balanza de comprobación").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'balance_excel_file').set(Rails.root.join "spec/contabilidad/resources/balanza/balanza_C7787.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo noCertificado tiene una longitud errónea (debe ser de 20 caracteres)"
  end

end