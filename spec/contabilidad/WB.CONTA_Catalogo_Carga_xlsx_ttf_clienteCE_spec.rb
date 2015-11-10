# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA - C7740 - Validar que el campo Mes sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7740.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Mes' de la hoja Generales debe contener un valor"
  end

end

describe "WB.CONTA - C7741 - Validar que el campo Año sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7741.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Año' de la hoja Generales debe contener un valor"
  end

end

describe "WB.CONTA - C7742 - Validar que el campo Código Agrupador sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7742.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo CatalogoCuenta es requerido"
  end

end

describe "WB.CONTA - C7743 - Validar que campo Numero de Cuenta sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7743.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Número de Cuenta' de la hoja CatálogoEmpresa debe contener un valor"
  end

end

describe "WB.CONTA - C7744 - Validar que el campo Nivel sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7744.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Nivel' de la hoja CatálogoEmpresa debe contener un valor"
  end

end

describe "WB.CONTA - C7745 - Validar que el campo Naturaleza sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7745.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Naturaleza' de la hoja CatálogoEmpresa debe contener un valor"
  end

end

describe "WB.CONTA - C7746 - Validar que el campo Descripción sea requerido para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7746.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Descripción de Cuenta' de la hoja CatálogoEmpresa debe contener un valor"
  end

end

describe "WB.CONTA - C7747 - Validar valores mayores a 13 en el campo Mes muestre mensaje para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7747.xlsx")
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
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7748.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Año' con valor: 2014 contenido en la hoja Generales del archivo xlsx debe contar con la estructura definida por el SAT, los posibles valores van de 2015 a 2099"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Año' con valor: 2014/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe contar con la estructura definida por el SAT, los posibles valores van de 2015 a 2099/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7749 - Validar letras en el campo Mes para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7749.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Mes' con valor: Dos contenido en la hoja Generales del archivo xlsx debe ser numérico de dos dígitos"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Mes' con valor: Dos/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser numérico de dos dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7750 - Validar letras en el campo Año para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7750.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Año' con valor: AAAA contenido en la hoja Generales del archivo xlsx debe contar con la estructura definida por el SAT, los posibles valores van de 2015 a 2099"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Año' con valor: AAAA/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe contar con la estructura definida por el SAT, los posibles valores van de 2015 a 2099/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7751 - Validar valores distintos en el campo Código Agrupador a los definidos por el SAT para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7751.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Código Agrupador' con valor: XXX del archivo xlsx debe ser un valor de Código Agrupador válido contenido en la hoja CatálogoEmpresa"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Código Agrupador' con valor: XXX/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un valor de Código Agrupador válido/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CatálogoEmpresa/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7752 - Validar valores con logitud mayor a 100 para el campo Numero de Cuenta para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7752.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Número de Cuenta' con valor: 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890 del archivo xlsx debe ser numérico con longitud de hasta 100 caracteres contenido en la hoja CatálogoEmpresa"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Número de Cuenta' con valor: 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser numérico con longitud de hasta 100 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CatálogoEmpresa/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7753 - Validar valores con longitud mayor a 400 para el campo Descripción para el archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7753.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Descripción de Cuenta' con valor: 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 contenido en la hoja CatálogoEmpresa del archivo xlsx debe ser alfanumérico con longitud de hasta 400 caracteres"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Descripción de Cuenta' con valor: 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser alfanumérico con longitud de hasta 400 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CatálogoEmpresa/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7754 - Validar valores con longitud mayor a 100 para el campo Clave de la Subcuenta del Archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7754.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Clave de la SubCuenta' con valor: 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123 contenido en la hoja CatálogoEmpresa del archivo xlsx debe tener una longitud de hasta 100 caracteres"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Clave de la SubCuenta' con valor: 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener una longitud de hasta 100 caracteres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CatálogoEmpresa/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7755 - Validar valores con longitud mayor a 1 para el campo Nivel del Archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7755.xlsx")
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
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7756.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Nivel' con valor: X contenido en la hoja CatálogoEmpresa del archivo xlsx debe ser numérico con longitud de hasta 100 dígitos"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Nivel' con valor: X/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser numérico con longitud de hasta 100 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CatálogoEmpresa/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7757 - Validar caracteres diferentes a A/D para el campo Naturaleza del Archivo de Cuentas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7757.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Naturaleza' con valor: X contenido en la hoja CatálogoEmpresa del archivo xlsx debe tener como valor: (D - Deudora, A - Acreedora). ( Activo = D ) ( Pasivo = A ) ( Capital = A ) ( Ingreso = A ) ( Costo = D ) ( Gasto = D ) ( Resultado Integral de Financiamiento = D y/o A ) ( Cuentas de orden = D y/o A )"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Naturaleza' con valor: X/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener como valor:/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CatálogoEmpresa/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7762 - Validar envío de archivo incompleto, sin una pestaña", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_C7762.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "La versión del archivo xlsx no es la esperada para el catálogo de cuentas"
  end

end