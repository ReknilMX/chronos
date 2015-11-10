# encoding: utf-8

require "wsspec_helper"

describe "C9012 - PLZ:Cheque. TipCamb - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C9010.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Cheque/@TipCamb").first.value.should == "1"
  end

end

describe "C9014 - PLZ:Transferencia. CtaOri - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@CtaOri").first.value.should == "9382716273"
  end

end

describe "C9015 - PLZ:Transferencia. BancoOriNal - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@BancoOriNal").first.value.should == "006"
  end

end

describe "C9016 - PLZ:Transferencia. BancoOriExt - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@BancoOriExt").first.value.should == "Banco Origen Ext"
  end

end

describe "C9017 - PLZ:Transferencia. Monto - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@Monto").first.value.should == "12762.51"
  end

end

describe "C9018 - PLZ:Transferencia. CtaDesc - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@CtaDest").first.value.should == "927368271"
  end

end

describe "C9019 - PLZ:Transferencia. BancoDestNal - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@BancoDestNal").first.value.should == "006"
  end

end

describe "C9020 - PLZ:Transferencia. BancoDestExt - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@BancoDestExt").first.value.should == "Banco origen Ext"
  end

end

describe "C9021 - PLZ:Transferencia. Fecha - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@Fecha").first.value.should == "2014-02-10"
  end

end

describe "C9022 - PLZ:Transferencia. Benef - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@Benef").first.value.should == "ORGANIZACION RG HERMANOS, SA DE CV"
  end

end

describe "C9023 - PLZ:Transferencia. RFC - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@RFC").first.value.should == "ORH100325SY1"
  end

end

describe "C9024 - PLZ:Transferencia. Moneda - Validar que se mapee de forma correcta el valor en el XML, cuando se tenga valor en el Tipo de Moneda" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C9024.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@Moneda").first.value.should == "MXN"
  end

end

describe "C9026 - PLZ:Transferencia. TipCamb - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C9024.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@TipCamb").first.value.should == "1"
  end

end

describe "C9028 - PLZ:OtrMetodoPago. MetPagoPol - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:OtrMetodoPago/@MetPagoPol").first.value.should == "01"
  end

end

describe "C9029 - PLZ:OtrMetodoPago. Fecha - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:OtrMetodoPago/@Fecha").first.value.should == "2014-02-10"
  end

end

describe "C9030 - PLZ:OtrMetodoPago. Benef - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:OtrMetodoPago/@Benef").first.value.should == "ORGANIZACION RG HERMANOS, SA DE CV"
  end

end

describe "C9031 - PLZ:OtrMetodoPago. RFC - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:OtrMetodoPago/@RFC").first.value.should == "ORH100325SY1"
  end

end

describe "C9032 - PLZ:OtrMetodoPago. Monto - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7890.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:OtrMetodoPago/@Monto").first.value.should == "2139.62"
  end

end

describe "C9035 PLZ:OtrMetodoPago. Moneda - Validar que no se mapee el atributo en el XML si no se Tiene un valor para el Tipo de Cambio" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C9035.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:OtrMetodoPago/@Moneda").first.value.should == "MXN"
  end

end

describe "C9036 PLZ:OtrMetodoPago. TipCamb - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C9035.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:OtrMetodoPago/@TipCamb").first.value.should == "1"
  end

end