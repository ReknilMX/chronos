# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA - C7790 - Validar que campo Mes sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7790.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Mes' de la hoja Generales debe contener un valor"
  end

end

describe "WB.CONTA - C7791 - Validar que el campo Año sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7791.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Año' de la hoja Generales debe contener un valor"
  end

end

describe "WB.CONTA - C7792 - Validar el campo Tipo de Solicitud sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7792.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Tipo de Solicitud' de la hoja Generales debe contener un valor"
  end

end

describe "WB.CONTA - C7793 - Validar que el campo Numero de Orden sea requerido cuando el campo Tipo de Solicitud sea AF", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7793.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo NumeroDeOrden es requerido cuando el Tipo de Solicitud es AF"
  end

end

describe "WB.CONTA - C7794 - Validar que el campo Numero de Orden sea requerido cuando el campo Tipo de Solicitud sea FC", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7794.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo NumeroDeOrden es requerido cuando el Tipo de Solicitud es FC"
  end

end

describe "WB.CONTA - C7795 - Validar que el campo NumTramite sea requerido cuando el Tipo de Solicitud sea DE", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7795.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo NumeroDeTramite es requerido cuando el Tipo de Solicitud es DE"
  end

end

describe "WB.CONTA - C7796 - Validar que el campo NumTramite sea requerido cuando el Tipo de Solicitud sea CO", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7796.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo NumeroDeTramite es requerido cuando el Tipo de Solicitud es CO"
  end

end

describe "WB.CONTA - C7797 - Validar que el campo UUID de la sección CompNal sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7797.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'UUID' de la hoja CompNal debe contener un valor"
  end

end

describe "WB.CONTA - C7798 - Validar que el campo RFC de la sección CompNal sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7798.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'RFC' de la hoja CompNal debe contener un valor"
  end

end

describe "WB.CONTA - C7799 - Validar que el campo Monto de la sección CompNal sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7799.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Monto' de la hoja CompNal debe contener un valor"
  end

end

describe "WB.CONTA - C7800 - Validar que el campo CCB Número de Folio de la sección CompNalOtr sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7800.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'CBB Número de Folio' de la hoja CompNalOtr debe contener un valor"
  end

end

describe "WB.CONTA - C7801 - Validar que el campo RFC de la sección CompNalOtr sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7801.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'RFC' de la hoja CompNalOtr debe contener un valor"
  end

end

describe "WB.CONTA - C7802 - Validar que el campo Monto de la sección CompNalOtr sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7802.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Monto' de la hoja CompNalOtr debe contener un valor"
  end

end

describe "WB.CONTA - C7803 - Validar que el campo Numero de Comprobante Extranjero de la sección CompExt sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7803.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Número de Comprobante Extranjero' de la hoja CompExt debe contener un valor"
  end

end

describe "WB.CONTA - C7804 - Validar que el campo Monto de la sección CompExt sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7804.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Monto' de la hoja CompExt debe contener un valor"
  end

end

describe "WB.CONTA - C7805 - Validar que el campo Número de Cheque de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7805.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Número Cheque' de la hoja Cheque debe contener un valor"
  end

end

describe "WB.CONTA - C7806 - Validar que el campo Banco Emisor Nal de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7806.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Banco Emisor Nal' de la hoja Cheque debe contener un valor"
  end

end

describe "WB.CONTA - C7807 - Validar que el campo Cuenta Origen de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7807.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Cuenta Origen' de la hoja Cheque debe contener un valor"
  end

end

describe "WB.CONTA - C7808 - Validar que el campo Fecha de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7808.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Fecha' de la hoja Cheque debe contener un valor"
  end

end

describe "WB.CONTA - C7809 - Validar que el campo Beneficiario de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7809.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Beneficiario' de la hoja Cheque debe contener un valor"
  end

end

describe "WB.CONTA - C7810 - Validar que el campo RFC de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7810.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'RFC' de la hoja Cheque debe contener un valor"
  end

end

describe "WB.CONTA - C7811 - Validar que el campo Monto de la sección Cheque sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7811.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Monto' de la hoja Cheque debe contener un valor"
  end

end

describe "WB.CONTA - C7812 - Validar que el campo Banco Origen Nacional de la sección Transferencia sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7812.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Banco Origen' de la hoja Transferencia debe contener un valor"
  end

end

describe "WB.CONTA - C7813 - Validar que el campo Cuenta destino de la sección Transferencia sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7813.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Cuenta Destino' de la hoja Transferencia debe contener un valor"
  end

end

describe "WB.CONTA - C7814 - Validar que el campo Banco Destino Nacional de la sección de Transferencia sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7814.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Banco Destino' de la hoja Transferencia debe contener un valor"
  end

end

describe "WB.CONTA - C7815 - Validar que el campo Fecha de la sección de Transferencia sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7815.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Fecha' de la hoja Transferencia debe contener un valor"
  end

end

describe "WB.CONTA - C7816 - Validar que el campo Beneficiario de la sección de Transferencia sea requerido para el archivo de Polizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7816.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Beneficiario' de la hoja Transferencia debe contener un valor"
  end

end

describe "WB.CONTA - C7817 - Validar que el campo RFC de la sección de Transferencia sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7817.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'RFC' de la hoja Transferencia debe contener un valor"
  end

end

describe "WB.CONTA - C7818 - Validar que el campo Monto de la sección de Transferencia sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7818.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Monto' de la hoja Transferencia debe contener un valor"
  end

end

describe "WB.CONTA - C7819 - Validar que el campo Método de Pago de la sección de Otro Método de Pago sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7819.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Método de Pago' de la hoja OtrMetodoPago debe contener un valor"
  end

end

describe "WB.CONTA - C7820 - Validar que el campo Fecha de la sección Otro Método de Pago sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7820.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Fecha' de la hoja OtrMetodoPago debe contener un valor"
  end

end

describe "WB.CONTA - C7821 - Validar que el campo Beneficiario de la sección Otro Método de Pago sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7821.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Beneficiario' de la hoja OtrMetodoPago debe contener un valor"
  end

end

describe "WB.CONTA - C7822 - Validar que el campo RFC de la sección Otro Método de Pago sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7822.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'RFC' de la hoja OtrMetodoPago debe contener un valor"
  end

end

describe "WB.CONTA - C7823 - Validar que el campo Monto de la sección Otro Método de Pago sea requerido para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7823.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    assert @driver.element(:id => "flash-alert").text.should == "El campo 'Monto' de la hoja OtrMetodoPago debe contener un valor"
  end

end

describe "WB.CONTA - C7824 - Validar que el campo mes con valores mayores a 12 para la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7824.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Mes' con valor: 13 contenido en la hoja Generales del archivo xlsx debe contar con la estructura definida por el SAT, los posibles valores van de 01 a 12"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Mes' con valor: 13/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe contar con la estructura definida por el SAT, los posibles valores van de 01 a 12/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7825 - Valiadar el campo año con valores menores a 2015 en la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7825.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Año' con valor: 2014 contenido en la hoja Generales del archivo xlsx debe contar con la estructura definida por el SAT, los posibles valores van de 2015 a 2099"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Año' con valor: 2014/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe contar con la estructura definida por el SAT, los posibles valores van de 2015 a 2099/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7826 - Validar que el campo Tipo de Solicitud con valores distintos a AF|FC|DE|CO para la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7826.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Tipo de Solicitud' con valor: XY contenido en la hoja Generales del archivo xlsx debe algun tipo válido de solicitud de la póliza (AF - Acto de Fiscalización; FC - Fiscalización Compulsa; DE - Devolución; CO - Compensación)"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Tipo de Solicitud' con valor: XY/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe algun tipo válido de solicitud de la póliza/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7827 - Validar el campo Número de Orden con una longitud mayor a 13 caracteres para la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7827.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Número de Orden' con valor: ABC0012345/012 del archivo xlsx debe tener un formato similar a ABC0012345/01 contenido en la hoja Generales"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Número de Orden' con valor: ABC0012345/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener un formato similar a ABC0012345/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7828 - Validar el campo Numero de Orden con caracteres especiales para la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7828.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Número de Trámite' con valor: 4772123456& del archivo xlsx Debe ser numerico de 10 dígitos contenido en la hoja Generales"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Número de Trámite' con valor: 4772123456&/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser numerico de 10 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7829 - Validar el campo Número de Trámite con longitud mayor a 10 para la sección de Generales para el archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7829.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Número de Trámite' con valor: 47721234561 contenido en la hoja Generales del archivo xlsx Debe ser numerico de 10 dígitos"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Número de Trámite' con valor: 47721234561/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser numerico de 10 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja Generales/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7830 - Validar el campo UUID con una longitud mayor a 36 caracteres para la sección de CompNal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7830.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'UUID' con valor: e1a15bc8-de01-4101-8538-2a18ecb33b281 contenido en la hoja CompNal del archivo xlsx debe tener el formato estandar de UUID"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'UUID' con valor: e1a15bc8-de01-4101-8538-2a18ecb33b281/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato estandar de UUID/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNal/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7831 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección CompNal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7831.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'RFC' con valor: AABH631101U834 contenido en la hoja CompNal del archivo xlsx debe ser un RFC válido para persona física o moral"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'RFC' con valor: AABH631101U834/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un RFC válido para persona física o moral/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNal/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7832 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección CompNal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7832.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'RFC' con valor: AABH631101U contenido en la hoja CompNal del archivo xlsx debe ser un RFC válido para persona física o moral"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'RFC' con valor: AABH631101U/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser un RFC válido para persona física o moral/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNal/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7834 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección CompNal", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7834.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Moneda' con valor: XYZ del archivo xlsx debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos. contenido en la hoja CompNal"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Moneda' con valor: XYZ/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser codigo ISO de moneda válido, favor de referirse al catálogo del SAT para encontrar los valores permitidos./
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNal/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7835 - Validar el campo Monto con letras para la sección CompNal del Archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7835.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Monto' con valor: AAA contenido en la hoja CompNal del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Monto' con valor: AAA/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNal/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7836 - Validar el campo Tipo de Cambio con letras para la sección Comp Nal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7836.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Tipo de Cambio' con valor: A del archivo xlsx debe tener el formato decimal de importe contenido en la hoja CompNal"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Tipo de Cambio' con valor: A/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNal/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7837 - Validar el campo con cantidades mayores a 20 digitos y 6 decimales para la sección Comp Nal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7837.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'Monto' con valor: 12345678901234567168.00 contenido en la hoja CompNal del archivo xlsx debe tener el formato decimal de importe"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'Monto' con valor: 12345678901234567168.00/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe tener el formato decimal de importe/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNal/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7838 - Validar el campo CBB- Serie con una longitud mayor a 10 para al sección de CompNalOtr de la sección de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7838.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'CBB - Serie' con valor: LPSA1234567 contenido en la hoja CompNalOtr del archivo xlsx debe ser de tipo caracter con longitud máxima de 10 carcateres"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'CBB - Serie' con valor: LPSA1234567/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser de tipo caracter con longitud máxima de 10 carcateres/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNalOtr/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7839 - Validar el campo CBB-Folio con letras para la sección CompNalOtr de la sección Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7839.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'CBB Número de Folio' con valor: AAA del archivo xlsx Debe ser numérico con una longitud máxima de 20 dígitos contenido en la hoja CompNalOtr"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'CBB Número de Folio' con valor: AAA/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser numérico con una longitud máxima de 20 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNalOtr/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end

describe "WB.CONTA - C7840 - Validar el campo CBB Número de Folio con una longitud mayor a 20 para la sección CompNal del archivo de Pólizas", :sauce => CONTAAPP_CONFIG['sauce'] do

  include_context "config"
  include_context "login_cliente_CE"

  it Time.now do
    @driver.link(:text => "Pólizas contables").click
    @driver.link(:text => "Importar pólizas").click
    @driver.file_field(:id => 'policy_excel_file').set(Rails.root.join "spec/contabilidad/resources/poliza/poliza_C7840.xlsx")
    @driver.element(:name => "commit").click
    @driver.div(:class => 'alert alert-danger text-left').wait_until_present
    #assert @driver.element(:id => "flash-alert").text.should == "El campo: 'CBB Número de Folio' con valor: 123456789012345678901 contenido en la hoja CompNalOtr del archivo xlsx Debe ser numérico con una longitud máxima de 20 dígitos"
    assert @driver.element(:id => "flash-alert").text.should =~ /El campo: 'CBB Número de Folio' con valor: 123456789012345678901/
    assert @driver.element(:id => "flash-alert").text.should =~ /debe ser numérico con una longitud máxima de 20 dígitos/
    assert @driver.element(:id => "flash-alert").text.should =~ /contenido en la hoja CompNalOtr/
    assert @driver.element(:id => "flash-alert").text.should =~ /del archivo xlsx/
  end

end