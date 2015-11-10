# encoding: utf-8

require "contabilidadspec_helper"

describe "WB.CONTA - C8072 - Validar que el campo Mes sea enviado correctamente en el xml generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Catalogo/@Mes").first.value.should == "03"
  end

end

describe "WB.CONTA - C8073 - Validar que el campo Año sea enviado correctamente en el xml generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Catalogo/@Anio").first.value.should == "2018"
  end

end

describe "WB.CONTA - C8074 - Validar que el campo código Agrupador sea enviado correctamente en el xml generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Ctas/@CodAgrup").first.value.should == "102"
  end

end

describe "WB.CONTA - C8075 - Validar que el Número de Cuenta sea enviado correctamente en el xml generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Ctas/@NumCta").first.value.should == "DF-99281"
  end

end

describe "WB.CONTA - C8076 - Validar que el campo Descripción sea enviado correctamente en el xml generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Ctas/@Desc").first.value.should == "Banco Nacional"
  end

end

describe "WB.CONTA - C8077 - Validar que el campo Nivel sea enviado correctamente en el XML generador", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Ctas/@Nivel").first.value.should == "1"
  end

end

describe "WB.CONTA - C8078 - Validar que el campo Naturaleza sea enviado correctamente en el XML generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Ctas/@Natur").first.value.should == "A"
  end

end

describe "WB.CONTA - C8079 - Validar que el campo versión sea enviado 1.1 por default en el XML generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Catalogo/@Version").first.value.should == "1.1"
  end

end

describe "WB.CONTA - C8080 - Validar que el campo RFC sea enviado correctamente en el XML generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Catalogo/@RFC").first.value.should == "AAA010101AAA"
  end

end

describe "WB.CONTA - C8081 - Validar que el Sello sea enviado en el XML generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Catalogo/@Sello").first.value.should =~ //
  end

end

describe "WB.CONTA - C8428 - Validar que el campo No de Certificado sea enviado en el XML generado", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Catalogo/@noCertificado").first.value.should == "20001000000200001428"
  end

end

describe "WB.CONTA - C8429 - Validar que el campo Certificado sea enviado en el XML", :sauce => CONTAAPP_CONFIG['sauce'] do

  it Time.now do
    document = Nokogiri::XML(File.read(Rails.root.join "spec/contabilidad/resources/downloads/AAA010101AAA201803CT.xml"))
    assert document.xpath("//catalogocuentas:Catalogo/@Certificado").first.value.should be_truthy
  end

end