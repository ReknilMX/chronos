# encoding: utf-8

require "wsspec_helper"

describe "C7944 - Validar RFC con &, Ñ para el archivo de Balanza" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C7944.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza/@RFC").first.value.should == "AB&010822TW7"
  end

end

describe "C7947 - Validar que el archivo de Balanza al estar correctamente formado pueda ser procesado y generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C7947.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
  end

end

describe "C8927 - Validar que el Numero de Cuenta sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8927.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza//BCE:Ctas/@NumCta").first.value.should == "1000101"
  end

end

describe "C8928 - Validar que el Saldo Incial sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8928.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza//BCE:Ctas/@SaldoIni").first.value.should == "1500.00"
  end

end

describe "C8929 - Validar que el Debe sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8929.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza//BCE:Ctas/@Debe").first.value.should == "0"
  end

end

describe "C8930 - Validar que el Haber sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8930.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza//BCE:Ctas/@Haber").first.value.should == "0"
  end

end

describe "C8931 - Validar que el Saldo Final sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8931.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza//BCE:Ctas/@SaldoFin").first.value.should == "1500"
  end

end

describe "C8932 - Validar que el Mes sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8932.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza/@Mes").first.value.should == "03"
  end

end

describe "C8933 - Validar que el año sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8933.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza/@Anio").first.value.should == "2015"
  end

end

describe "C8934 - Validar que la fecha de modificación de la Balanza sea enviada correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8934.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza/@FechaModBal").first.value.should == "2015-02-28"
  end

end

describe "C8935 - Validar que el tipo de envío sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8935.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza/@TipoEnvio").first.value.should == "C"
  end

end

describe "C8936 - Validar que la versión tenga por default 1.1 al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8936.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza/@Version").first.value.should == "1.1"
  end

end

describe "C8937 - Validar que el RFC sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8937.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza/@RFC").first.value.should == "AAA010101AAA"
  end

end

describe "C8938 - Validar que el Sello sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8938.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza/@Sello").first.value.should be_truthy
  end

end

describe "C8939 - Validar que el No de Certificado sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8939.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza/@noCertificado").first.value.should == "20001000000200001428"
  end

end

describe "C8940 - Validar que el certificado sea enviado correctamente al generar el xml" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/balanza/balanza_C8940.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_balanza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//BCE:Balanza/@Certificado").first.value.should be_truthy
  end

end