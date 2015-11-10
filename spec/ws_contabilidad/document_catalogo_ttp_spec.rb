# encoding: utf-8

require "wsspec_helper"

describe "C7918 - Validar RFC con &, Ñ para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7918.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo/@RFC").first.value.should == "AB&010822TW7"
  end

end

describe "C7921 - Validar que el archivo de Cuentas al estar correctamente formado pueda ser procesado y generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7921.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
  end

end

describe "C8916 - Validar que el se envie correctamente el mes en el XML generado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C8916.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo/@Mes").first.value.should == "03"
  end

end

describe "C8917 - Validar que se envie correctamente el año en el XML generado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C8917.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo/@Anio").first.value.should == "2015"
  end

end

describe "C8918 - Validar que se envie correctamente el Código Agrupador en el XML generado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C8918.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo//catalogocuentas:Ctas/@CodAgrup").first.value.should == "102"
  end

end

describe "C8919 - Validar que se envie Correctamente el No de Cuenta en el XML generado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C8919.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo//catalogocuentas:Ctas/@NumCta").first.value.should == "DF-99281"
  end

end

describe "C8920 - Validar que se envie La descripción de al Cuenta en el xml Generado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C8920.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo//catalogocuentas:Ctas/@Desc").first.value.should == "Banco Nacional"
  end

end

describe "C8921 - Validar que se envie correctamente el Nivel en el xml generado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C8921.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo//catalogocuentas:Ctas/@Nivel").first.value.should == "1"
  end

end

describe "C8922 - Validar que se envie la Naturaleza de la Cuenta en el xml generado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C8922.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo//catalogocuentas:Ctas/@Natur").first.value.should == "A"
  end

end

describe "C8923 - Validar que se envie la version 1.1. en el xml generado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C8923.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo/@Version").first.value.should == "1.1"
  end

end

describe "C8924 - Validar que se envie el RFC correctamente en el xml generado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C8924.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo/@RFC").first.value.should == "AAA010101AAA"
  end

end

describe "C8925 - Validar que se envie el sello correctamente en el xml generado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C8925.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo/@Sello").first.value.should =~ //
  end

end

describe "C8926 - Validar que se envie el No de Certificado correctamente en el xml generado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C8926.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//catalogocuentas:Catalogo/@noCertificado").first.value.should == "20001000000200001428"
  end

end