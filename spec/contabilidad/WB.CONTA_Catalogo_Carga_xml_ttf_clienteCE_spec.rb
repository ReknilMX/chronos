# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA - C7740 - Validar que el campo Mes sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7740.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Mes debe contener un valor\nError en línea 2: El campo Mes no es un número"
  end

end

describe "WB.CONTA - C7741 - Validar que el campo Año sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7741.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Anio debe contener un valor\nError en línea 2: El campo Anio no es un número"
  end

end

describe "WB.CONTA - C7742 - Validar que el campo Código Agrupador sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7742.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta DF-99281: El campo CodAgrup debe contener un valor\nError en línea 3 Cta DF-99281: El campo CodAgrup no contiene un valor válido"
  end

end

describe "WB.CONTA - C7743 - Validar que campo Numero de Cuenta sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7743.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta : El campo NumCta debe contener un valor"
  end

end

describe "WB.CONTA - C7744 - Validar que el campo Nivel sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7744.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta DF-99281: El campo Nivel debe contener un valor\nError en línea 3 Cta DF-99281: El campo Nivel no es un número\nError en línea 3 Cta DF-99281: El campo Nivel longitud errónea (debe ser de 1 carácter)"
  end

end

describe "WB.CONTA - C7745 - Validar que el campo Naturaleza sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7745.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta DF-99281: El campo Natur debe contener un valor\nError en línea 3 Cta DF-99281: El campo Natur no tiene un valor válido (Valores válidos A y D)"
  end

end

describe "WB.CONTA - C7746 - Validar que el campo Descripción sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7746.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta DF-99281: El campo Desc debe contener un valor"
  end

end

describe "WB.CONTA - C7747 - Validar valores mayores a 13 en el campo Mes muestre mensaje para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7747.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Mes debe ser mayor a 0 y menor a 13"
  end

end

describe "WB.CONTA - C7748 - Validar valores menores al 2015 en el campo Año para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7748.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Anio debe ser mayor a 2014 y menor a 2100"
  end

end

describe "WB.CONTA - C7749 - Validar letras en el campo Mes para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7749.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Mes no es un número"
  end

end

describe "WB.CONTA - C7750 - Validar letras en el campo Año para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7750.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo Anio no es un número"
  end

end

describe "WB.CONTA - C7751 - Validar valores distintos en el campo Código Agrupador a los definidos por el SAT para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7751.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta DF-99281: El campo CodAgrup no contiene un valor válido"
  end

end

describe "WB.CONTA - C7752 - Validar valores con logitud mayor a 100 para el campo Numero de Cuenta para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7752.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901: El campo NumCta tiene una longitud errónea (mínimo 1 carácter, máximo 100 caracteres)"
  end

end

describe "WB.CONTA - C7753 - Validar valores con longitud mayor a 400 para el campo Descripción para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7753.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta DF-99281: El campo Desc tiene una longitud errónea (mínimo 1 carácter, máximo 400 caracteres)"
  end

end

describe "WB.CONTA - C7754 - Validar valores con longitud mayor a 100 para el campo Clave de la Subcuenta del Archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7754.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 4 Cta 1180-4000: El campo SubCtaDe es demasiado largo (máximo 100 caracteres)"
  end

end

describe "WB.CONTA - C7755 - Validar valores con longitud mayor a 1 para el campo Nivel del Archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7755.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 4 Cta 1180-4000: El campo Nivel longitud errónea (debe ser de 1 carácter)"
  end

end

describe "WB.CONTA - C7756 - Validar letras en el campo Nivel del Archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7756.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta DF-99281: El campo Nivel no es un número"
  end

end

describe "WB.CONTA - C7757 - Validar caracteres diferentes a A/D para el campo Naturaleza del Archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7757.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 3 Cta DF-99281: El campo Natur no tiene un valor válido (Valores válidos A y D)"
  end

end

describe "WB.CONTA - C7758 - Validar RFC con logitud menor a 12 caracteres para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7758.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo RFC es demasiado corto (mínimo 12 caracteres)\nError en línea 2: El campo RFC no coincide con el rfc de la empresa actual"
  end

end

describe "WB.CONTA - C7759 - Validar RFC con longitud mayor a 13 caracteres para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7759.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo RFC no es válido\nError en línea 2: El campo RFC es demasiado largo (máximo 13 caracteres)\nError en línea 2: El campo RFC no coincide con el rfc de la empresa actual"
  end

end

describe "WB.CONTA - C7760 - Validar RFC con &, Ñ para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7760.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo RFC no coincide con el rfc de la empresa actual"
  end

end

describe "WB.CONTA - C7761 - Validar Numero de certificado mayor a 20 caracteres para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7761.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "Error en línea 2: El campo noCertificado tiene una longitud errónea (debe ser de 20 caracteres)"
  end

end