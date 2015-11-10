# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA - C7763 - Validar que el archivo de Cuentas al estar correctamente formado pueda ser procesado correctamente", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
  end

end

describe "WB.CONTA - C8072 - Validar que el campo Mes sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:css => "h1.title").text.should =~ /marzo/
  end

end

describe "WB.CONTA - C8073 - Validar que el campo Año sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:css => "h1.title").text.should =~ /2018/
  end

end

describe "WB.CONTA - C8074 - Validar que el campo código Agrupador sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[1]").text.should == "102"
  end

end

describe "WB.CONTA - C8075 - Validar que el Número de Cuenta sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[3]").text.should == "DF-99281"
  end

end

describe "WB.CONTA - C8076 - Validar que el campo Descripción sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[4]").text.should == "Banco Nacional"
  end

end

describe "WB.CONTA - C8078 - Validar que el campo Naturaleza sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[2]").text.should == "Acreedora"
  end

end

describe "WB.CONTA - C7763 - Validar que el archivo de Cuentas al estar correctamente formado pueda ser procesado correctamente", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
  end

end

describe "WB.CONTA - C8072 - Validar que el campo Mes sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:css => "h1.title").text.should =~ /marzo/
  end

end

describe "WB.CONTA - C8073 - Validar que el campo Año sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:css => "h1.title").text.should =~ /2018/
  end

end

describe "WB.CONTA - C8074 - Validar que el campo código Agrupador sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[1]").text.should == "102"
  end

end

describe "WB.CONTA - C8075 - Validar que el Número de Cuenta sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[3]").text.should == "DF-99281"
  end

end

describe "WB.CONTA - C8076 - Validar que el campo Descripción sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[4]").text.should == "Banco Nacional"
  end

end

describe "WB.CONTA - C8078 - Validar que el campo Naturaleza sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CE"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[2]").text.should == "Acreedora"
  end

end

describe "WB.CONTA - C7763 - Validar que el archivo de Cuentas al estar correctamente formado pueda ser procesado correctamente", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
  end

end

describe "WB.CONTA - C8072 - Validar que el campo Mes sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:css => "h1.title").text.should =~ /marzo/
  end

end

describe "WB.CONTA - C8073 - Validar que el campo Año sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:css => "h1.title").text.should =~ /2018/
  end

end

describe "WB.CONTA - C8074 - Validar que el campo código Agrupador sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[1]").text.should == "102"
  end

end

describe "WB.CONTA - C8075 - Validar que el Número de Cuenta sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[3]").text.should == "DF-99281"
  end

end

describe "WB.CONTA - C8076 - Validar que el campo Descripción sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[4]").text.should == "Banco Nacional"
  end

end

describe "WB.CONTA - C8078 - Validar que el campo Naturaleza sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[2]").text.should == "Acreedora"
  end

end

describe "WB.CONTA - C7763 - Validar que el archivo de Cuentas al estar correctamente formado pueda ser procesado correctamente", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
  end

end

describe "WB.CONTA - C8072 - Validar que el campo Mes sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:css => "h1.title").text.should =~ /marzo/
  end

end

describe "WB.CONTA - C8073 - Validar que el campo Año sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:css => "h1.title").text.should =~ /2018/
  end

end

describe "WB.CONTA - C8074 - Validar que el campo código Agrupador sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[1]").text.should == "102"
  end

end

describe "WB.CONTA - C8075 - Validar que el Número de Cuenta sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[3]").text.should == "DF-99281"
  end

end

describe "WB.CONTA - C8076 - Validar que el campo Descripción sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[4]").text.should == "Banco Nacional"
  end

end

describe "WB.CONTA - C8078 - Validar que el campo Naturaleza sea enviado correctamente en el resumen generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_contador_CEPR"

  it Time.now do
    @driver.link(:text => "Catálogo de cuentas").click
    @driver.link(:text => "Importar").click
    @driver.file_field(:id => 'account_catalog_excel_file').set(Rails.root.join "spec/contabilidad/resources/catalogo/catalogo_template.xml")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
    if @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado. Ya existe un catálogo asignado a este periodo, clic aquí para visualizarlo."
      @driver.link(:text => "Sobreescribir").click
      @driver.link(:text => "Aceptar").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    else
      assert @driver.element(:id => "flash-alert").text.should == "El catálogo de cuentas ha sido procesado."
      @driver.element(:class => "btn btn-primary").click
      assert @driver.element(:id => "flash-alert").text.should == "El documento fue sellado."
    end
    assert @driver.element(:xpath => "//div[1]/div[2]/div/div[2]/div[2]/div[1]/table/tbody/tr[2]/td[2]").text.should == "Acreedora"
  end

end