# encoding: utf-8

require "wsspec_helper"

describe "C7833 - Validar el campo RFC caracteres &&ÑÑ para la sección CompNal del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7833.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:CompNal/@RFC").first.value.should == "OÑ&100325SY1"
  end

end

describe "C7844 - Validar el campo RFC caracteres &&ÑÑ para la sección CompNalOtr del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7844.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:CompNalOtr/@RFC").first.value.should == "ORÑ&100325SY1"
  end

end

describe "C7873 - Validar el campo RFC caracteres &&ÑÑ para la sección Transferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7873.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:Transferencia/@RFC").first.value.should == "ORÑ&100325SY1"
  end

end

describe "C7882 - Validar el campo RFC caracteres &&ÑÑ para la sección OtrMetodoPago" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7882.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:OtrMetodoPago/@RFC").first.value.should == "OÑ&100325SY1"
  end

end

describe "C7890 - Validar que el archivo Pólizas al estar correctamente formado pueda ser procesado correctamente" do

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
  end

end

describe "C8960 - Polizas. Version- Validar que se mapee de forma correcta el valor 1.1 En el XML" do

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
    assert response.xpath("//PLZ:Polizas/@Version").first.value.should == "1.1"
  end

end

describe "C8961 - Polizas. RFC - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Polizas/@RFC").first.value.should == "AAA010101AAA"
  end

end

describe "C8962 - Polizas. Mes - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Polizas/@Mes").first.value.should == "06"
  end

end

describe "C8963 - Polizas. Anio - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Polizas/@Anio").first.value.should == "2016"
  end

end

describe "C8964 Polizas. TipoSolicitud - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Polizas/@TipoSolicitud").first.value.should == "AF"
  end

end

describe "C8965 - Polizas. NumOrden - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Polizas/@NumOrden").first.value.should == "ABC0012345/01"
  end

end

describe "C8967 - Polizas. NumTramite - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Polizas/@NumTramite").first.value.should == "4772123456"
  end

end

describe "C8969 - Polizas. Sello - Validar que se genere de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Polizas/@Sello").first.value.should =~ //
  end

end

describe "C8970 - Polizas. noCertificado - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Polizas/@noCertificado").first.value.should == "20001000000200001428"
  end

end

describe "C8971 - Polizas. Certificado - Validar que se genere de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Polizas/@Certificado").first.value.should be_truthy
  end

end

describe "C8972 - PLZ:Poliza. NuUnIdenPol - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Poliza/@NumUnIdenPol").first.value.should == "139629"
  end

end

describe "C8973 - PLZ:Poliza. Fecha - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Poliza/@Fecha").first.value.should == "2014-02-04"
  end

end

describe "C8974 - PLZ:Poliza. Concepto - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Poliza/@Concepto").first.value.should == "Pagos Efectuados - ORH100325SY1P"
  end

end

describe "C8975 - PLZ:Transacción. NumCta - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Transaccion/@NumCta").first.value.should == "11804000002A"
  end

end

describe "C8976 - PLZ:Transacción. DesCta - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Transaccion/@DesCta").first.value.should == "IVA Acreditable"
  end

end

describe "C8977 - PLZ:Transacción. Concepto - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Transaccion/@Concepto").first.value.should == "Pagos pendientes de aplicar"
  end

end

describe "C8978 - PLZ:Transacción. Debe - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Transaccion/@Debe").first.value.should == "0"
  end

end

describe "C8979 - PLZ:Transacción. Haber - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Transaccion/@Haber").first.value.should == "402.8"
  end

end

describe "C8980 - PLZ:CompNal. UUID_CFDI - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:CompNal/@UUID_CFDI").first.value.should == "11c7a692-f2e8-4a72-b78a-b305445253cf"
  end

end

describe "C8981 - PLZ:CompNal. MontoTotal - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:CompNal/@MontoTotal").first.value.should == "2139.62"
  end

end

describe "C8982 - PLZ:CompNal. RFC - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:CompNal/@RFC").first.value.should == "ORH100325SY1"
  end

end

describe "C8983 - PLZ:CompNal. Moneda - Validar que se mapee de forma correcta el valor en el XML, cuando se tenga valor en el Tipo de Moneda" do

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
    assert response.xpath("//PLZ:CompNal/@Moneda").first.value.should == "MXN"
  end

end

describe "C8984 - PLZ:CompNal. Moneda - Validar que no se mapee el atributo en el XML si no se Tiene un valor para el Tipo de Cambio" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C8984.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:CompNal/@Moneda").should be_truthy
  end

end

describe "C8985 - PLZ:CompNal. TipCamb - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C8985.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:CompNal/@TipCamb").first.value.should == "1"
  end

end

describe "C8987 - PLZ:CompNalOtr. CFD_CBB_Serie - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:CompNalOtr/@CFD_CBB_Serie").first.value.should == "HGS"
  end

end

describe "C8988 - PLZ:CompNalOtr. CFD_CBB_NumFol - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:CompNalOtr/@CFD_CBB_NumFol").first.value.should == "1267"
  end

end

describe "C8989 - PLZ:CompNalOtr. RFC - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:CompNalOtr/@RFC").first.value.should == "ORH100325SY1"
  end

end

describe "C8990 - PLZ:CompNalOtr. MontoTotal - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:CompNalOtr/@MontoTotal").first.value.should == "2139.62"
  end

end

describe "C8991 - PLZ:CompNalOtr. Moneda - Validar que se mapee de forma correcta el valor en el XML, cuando se tenga valor en el Tipo de Moneda" do

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
    assert response.xpath("//PLZ:CompNalOtr/@Moneda").first.value.should == "MXN"
  end

end

describe "C8993 - PLZ:CompNalOtr. TipCamb - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C8993.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:CompNalOtr/@TipCamb").first.value.should == "1"
  end

end

describe "C8993 - PLZ:CompNalOtr. TipCamb - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C8993.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:CompNalOtr/@TipCamb").first.value.should == "1"
  end

end

describe "C8995 - PLZ:CompExt. NumFactExt - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:CompExt/@NumFactExt").first.value.should == "11c7a692f2e84a72b78ab305445253cfaaa1"
  end

end

describe "C8996 - PLZ:CompExt. TaxID - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:CompExt/@TaxID").first.value.should == "ORH100325SY1008SA"
  end

end

describe "C8997 - PLZ:CompExt. MontoTotal - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:CompExt/@MontoTotal").first.value.should == "217.12"
  end

end

describe "C8998 - PLZ:CompExt. Moneda - Validar que se mapee de forma correcta el valor en el XML, cuando se tenga valor en el Tipo de Moneda" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C8998.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:CompExt/@Moneda").first.value.should == "USD"
  end

end

describe "C9000 - PLZ:CompExt. TipCamb - Validar que se mapee de forma correcta el valor en el XML" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C8998.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = Nokogiri::XML(res.body)
    assert response.should be_truthy
    assert response.xpath("//PLZ:CompExt/@TipCamb").first.value.should == "13.35"
  end

end

describe "C9002 - PLZ:Cheque. Num - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Cheque/@Num").first.value.should == "11"
  end

end

describe "C9003 - PLZ:Cheque. BancoEmisNal - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Cheque/@BanEmisNal").first.value.should == "128"
  end

end

describe "C9004 - PLZ:Cheque. BancoEmisExt - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Cheque/@BanEmisExt").first.value.should == "Banco Extranjero 006"
  end

end

describe "C9005 - PLZ:Cheque. CtaOri - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Cheque/@CtaOri").first.value.should == "ABC123456789"
  end

end

describe "C9006 - PLZ:Cheque. Fecha - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Cheque/@Fecha").first.value.should == "2014-02-10"
  end

end

describe "C9007 - PLZ:Cheque. Monto - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Cheque/@Monto").first.value.should == "19999.12"
  end

end

describe "C9008 - PLZ:Cheque. Benef - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Cheque/@Benef").first.value.should == "IYASNET HERNANDEZ REYES"
  end

end

describe "C9009 - PLZ:Cheque. RFC - Validar que se mapee de forma correcta el valor en el XML" do

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
    assert response.xpath("//PLZ:Cheque/@RFC").first.value.should == "HERI801025LG8"
  end

end

describe "C9010 - PLZ:Cheque. Moneda - Validar que se mapee de forma correcta el valor en el XML, cuando se tenga valor en el Tipo de Moneda" do

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
    assert response.xpath("//PLZ:Cheque/@Moneda").first.value.should == "MXN"
  end

end