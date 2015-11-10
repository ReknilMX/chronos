# encoding: utf-8

require "wsspec_helper"

describe "C7841 - Validar el campo CBB Número de Folio con letras para la sección CompNalOtr del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7841.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr', attribute 'CFD_CBB_NumFol': 'AAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7842 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección CompNalOtr del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7842.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'RFC': [facet 'minLength'] The value 'ORH100325SY' has a length of '11'; this underruns the allowed minimum length of '12'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'RFC': 'ORH100325SY' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7843 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección CompNalOtr del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7843.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'RFC': [facet 'pattern'] The value 'ORH100325SY13' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9]?[A-Z0-9]?[0-9A-Z]?'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'RFC': 'ORH100325SY13' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7843 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección CompNalOtr del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7843.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'RFC': [facet 'pattern'] The value 'ORH100325SY13' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9]?[A-Z0-9]?[0-9A-Z]?'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'RFC': 'ORH100325SY13' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7845 - Validar el campo Monto con letras para la sección CompNalOtr del Archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7845.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr', attribute 'MontoTotal': 'AAAAAA' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}t_Importe'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7846 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección CompNalOtr" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7846.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr', attribute 'Moneda': [facet 'enumeration'] The value 'XYZ' is not an element of the set {'AED', 'AFN', 'ALL', 'AMD', 'ANG', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BGN', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYR', 'BZD', 'CAD', 'CDF', 'CHF', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CSD', 'CUP', 'CUC', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HRK', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LTL', 'LVL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRO', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLL', 'SOS', 'SRD', 'STD', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'USS', 'UYU', 'UZS', 'VEF', 'VND', 'VUV', 'WST', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XDR', 'XFO', 'XFU', 'XOF', 'XPD', 'XPF', 'XPT', 'XTS', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWL'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr', attribute 'Moneda': 'XYZ' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogosParaEsqContE}c_Moneda'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7847 - Validar el campo Tipo de Cambio con letras para la sección CompNalOtr del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7847.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr', attribute 'TipCamb': 'AAAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7848 - Validar el campo Número con una longitud mayor a 36 de Comprobante Extranjero para la sección CompExt del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7848.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompExt', attribute 'NumFactExt': [facet 'maxLength'] The value '11c7a692f2e84a72b78ab305445253cfaaa11' has a length of '37'; this exceeds the allowed maximum length of '36'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompExt', attribute 'NumFactExt': '11c7a692f2e84a72b78ab305445253cfaaa11' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7849 - Validar el campo TAx Id con una longitud mayor a 30 para la sección CompExt del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7849.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompExt', attribute 'TaxID': [facet 'maxLength'] The value 'ORH100325SY1008SAORH100325SY111' has a length of '31'; this exceeds the allowed maximum length of '30'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompExt', attribute 'TaxID': 'ORH100325SY1008SAORH100325SY111' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7850 - Validar el campo Monto con letras para la sección CompExt del Archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7850.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompExt', attribute 'MontoTotal': 'AAAA' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}t_Importe'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7851 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección CompExt" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7851.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompExt', attribute 'Moneda': [facet 'enumeration'] The value 'XYZ' is not an element of the set {'AED', 'AFN', 'ALL', 'AMD', 'ANG', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BGN', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYR', 'BZD', 'CAD', 'CDF', 'CHF', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CSD', 'CUP', 'CUC', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HRK', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LTL', 'LVL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRO', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLL', 'SOS', 'SRD', 'STD', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'USS', 'UYU', 'UZS', 'VEF', 'VND', 'VUV', 'WST', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XDR', 'XFO', 'XFU', 'XOF', 'XPD', 'XPF', 'XPT', 'XTS', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWL'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompExt', attribute 'Moneda': 'XYZ' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogosParaEsqContE}c_Moneda'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7852 - Validar el campo Tipo de Cambio con letras para la sección CompExt del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7852.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompExt', attribute 'TipCamb': 'AAAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7853 - Validar el campo Número de Cheque con longitudes mayores a 20 para la sección Cheque del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7853.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'Num': [facet 'maxLength'] The value '123456789123456789123' has a length of '21'; this exceeds the allowed maximum length of '20'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'Num': '123456789123456789123' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7854 - Validar el campo Banco Emisor Nal con valores distintos al catálogo del SAT para la sección de Cheque" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7854.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'BanEmisNal': [facet 'enumeration'] The value '987' is not an element of the set {'002', '006', '009', '012', '014', '019', '021', '030', '032', '036', '037', '042', '044', '058', '059', '060', '062', '072', '102', '103', '106', '108', '110', '112', '113', '116', '124', '126', '127', '128', '129', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '141', '143', '145', '166', '168', '600', '601', '602', '605', '606', '607', '608', '610', '614', '615', '616', '617', '618', '619', '620', '621', '622', '623', '626', '627', '628', '629', '630', '631', '632', '633', '634', '636', '637', '638', '640', '642', '646', '647', '648', '649', '651', '652', '653', '655', '656', '659', '901', '902', '670', '999'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'BanEmisNal': '987' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogosParaEsqContE}c_Banco'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7855 - Validar el campo Banco Emisor Ext con una longitud mayor a 150 caracteres para la sección de Cheque" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7855.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'BanEmisExt': [facet 'maxLength'] The value 'Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006' has a length of '209'; this exceeds the allowed maximum length of '150'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'BanEmisExt': 'Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006 Banco Extranjero 006' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7856 - Validar el campo Cuenta Origen con una longitud mayor a 50 caracteres para la sección de Cheque" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7856.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'CtaOri': [facet 'maxLength'] The value 'ABC123456789ABC123456789ABC123456789ABC123456789ABC123456789' has a length of '60'; this exceeds the allowed maximum length of '50'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'CtaOri': 'ABC123456789ABC123456789ABC123456789ABC123456789ABC123456789' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7857 - Validar el campo Fecha con letras y números para la sección Cheque" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7857.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'Fecha': 'AAAAA' is not a valid value of the atomic type 'xs:date'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7858 - Validar el campo Beneficiario con una longitud mayor a 300 caracteres para la sección Cheque" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7858.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'Benef': [facet 'maxLength'] The value 'IYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYES' has a length of '368'; this exceeds the allowed maximum length of '300'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'Benef': 'IYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYESIYASNET HERNANDEZ REYES' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7859 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección Cheque" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7859.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'RFC': [facet 'minLength'] The value 'HERI801025L' has a length of '11'; this underruns the allowed minimum length of '12'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'RFC': 'HERI801025L' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7860 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección Cheque" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7860.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'RFC': [facet 'maxLength'] The value 'HERI801025LG81' has a length of '14'; this exceeds the allowed maximum length of '13'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'RFC': [facet 'pattern'] The value 'HERI801025LG81' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9]?[A-Z0-9]?[0-9A-Z]?'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'RFC': 'HERI801025LG81' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7861 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección Cheque" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7861.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'Moneda': [facet 'enumeration'] The value 'XYZ' is not an element of the set {'AED', 'AFN', 'ALL', 'AMD', 'ANG', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BGN', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYR', 'BZD', 'CAD', 'CDF', 'CHF', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CSD', 'CUP', 'CUC', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HRK', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LTL', 'LVL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRO', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLL', 'SOS', 'SRD', 'STD', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'USS', 'UYU', 'UZS', 'VEF', 'VND', 'VUV', 'WST', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XDR', 'XFO', 'XFU', 'XOF', 'XPD', 'XPF', 'XPT', 'XTS', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWL'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'Moneda': 'XYZ' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogosParaEsqContE}c_Moneda'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7862 - Validar el campo Tipo de Cambio con letras para la sección Cheque" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7862.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque', attribute 'TipCamb': 'AAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7863 - Validar el Campo Cuenta Origen con una longitud mayor 50 para la sección de Transferencia del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7863.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'CtaOri': [facet 'maxLength'] The value '938271627393827162739382716273938271627393827162731' has a length of '51'; this exceeds the allowed maximum length of '50'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'CtaOri': '938271627393827162739382716273938271627393827162731' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7864 - Validar el campo Banco Origen con valores distintor a los del catálogo definido por elñ SAT para la sección de Transferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7864.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'BancoOriNal': [facet 'enumeration'] The value '987' is not an element of the set {'002', '006', '009', '012', '014', '019', '021', '030', '032', '036', '037', '042', '044', '058', '059', '060', '062', '072', '102', '103', '106', '108', '110', '112', '113', '116', '124', '126', '127', '128', '129', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '141', '143', '145', '166', '168', '600', '601', '602', '605', '606', '607', '608', '610', '614', '615', '616', '617', '618', '619', '620', '621', '622', '623', '626', '627', '628', '629', '630', '631', '632', '633', '634', '636', '637', '638', '640', '642', '646', '647', '648', '649', '651', '652', '653', '655', '656', '659', '901', '902', '670', '999'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'BancoOriNal': '987' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogosParaEsqContE}c_Banco'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7865 - Validar el campo Origen Extranjero con longitud mayor a 150 para la sección de Trasferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7865.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'BancoOriExt': [facet 'maxLength'] The value 'Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext 1' has a length of '171'; this exceeds the allowed maximum length of '150'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'BancoOriExt': 'Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext Banco Origen Ext 1' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7866 - Validar el campo Cuenta Destino con longitudes mayores a 50 para la sección de Transferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7866.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'CtaDest': [facet 'maxLength'] The value '927368271192736827119273682711927368271192736827111' has a length of '51'; this exceeds the allowed maximum length of '50'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'CtaDest': '927368271192736827119273682711927368271192736827111' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7867 - Validar el campo Banco Destino Nacional con valores distintos a los del Catalogo del SAT" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7867.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'BancoDestNal': [facet 'enumeration'] The value '987' is not an element of the set {'002', '006', '009', '012', '014', '019', '021', '030', '032', '036', '037', '042', '044', '058', '059', '060', '062', '072', '102', '103', '106', '108', '110', '112', '113', '116', '124', '126', '127', '128', '129', '130', '131', '132', '133', '134', '135', '136', '137', '138', '139', '140', '141', '143', '145', '166', '168', '600', '601', '602', '605', '606', '607', '608', '610', '614', '615', '616', '617', '618', '619', '620', '621', '622', '623', '626', '627', '628', '629', '630', '631', '632', '633', '634', '636', '637', '638', '640', '642', '646', '647', '648', '649', '651', '652', '653', '655', '656', '659', '901', '902', '670', '999'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'BancoDestNal': '987' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogosParaEsqContE}c_Banco'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7868 - Validar el campo Banco Destino Extranjero con longitud mayor a 150 para la sección de Transferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7868.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'BancoDestExt': [facet 'maxLength'] The value 'Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext' has a length of '169'; this exceeds the allowed maximum length of '150'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'BancoDestExt': 'Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext Banco origen Ext' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7869 - Validar el campo Fecha con letras y números para la sección de Transferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7869.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'Fecha': 'AAAAA' is not a valid value of the atomic type 'xs:date'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7870 - Validar el campo Beneficiario con con longitudes mayores a 300 caracteres para la sección de Transferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7870.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'Benef': [facet 'maxLength'] The value ', SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV v RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV' has a length of '522'; this exceeds the allowed maximum length of '300'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'Benef': ', SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV v RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV RGANIZACION RG HERMANOS, SA DE CV' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7871 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección Transferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7871.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'RFC': [facet 'minLength'] The value 'ORH100325SY' has a length of '11'; this underruns the allowed minimum length of '12'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'RFC': 'ORH100325SY' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7872 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección Transferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7872.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'RFC': [facet 'pattern'] The value 'ORH100325SY11' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9]?[A-Z0-9]?[0-9A-Z]?'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'RFC': 'ORH100325SY11' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7874 - Validar el campo Monto con letras para la sección Transferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7874.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'Monto': 'AAAAAA' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}t_Importe'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7875 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección Transferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7875.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'Moneda': [facet 'enumeration'] The value 'XYZ' is not an element of the set {'AED', 'AFN', 'ALL', 'AMD', 'ANG', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BGN', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYR', 'BZD', 'CAD', 'CDF', 'CHF', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CSD', 'CUP', 'CUC', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HRK', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LTL', 'LVL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRO', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLL', 'SOS', 'SRD', 'STD', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'USS', 'UYU', 'UZS', 'VEF', 'VND', 'VUV', 'WST', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XDR', 'XFO', 'XFU', 'XOF', 'XPD', 'XPF', 'XPT', 'XTS', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWL'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'Moneda': 'XYZ' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogosParaEsqContE}c_Moneda'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7876 - Validar el campo Tipo de Cambio con letras para la sección Transferencia" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7876.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia', attribute 'TipCamb': 'AAAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7877 - Validar el campo Método de Pago con valores distintos a los del catálogo definido por el SAT para la sección de OtrMetodoPago" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7877.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'MetPagoPol': [facet 'enumeration'] The value '88' is not an element of the set {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12', '13', '14', '15', '16', '17', '98', '99'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'MetPagoPol': '88' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogosParaEsqContE}c_MetPagos'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7878 - Validar el campo Fecha con letras y números para la sección OtrMetodoPago" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7878.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'Fecha': 'AAAAA' is not a valid value of the atomic type 'xs:date'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7879 - Validar el campo Beneficiario con una longitud mayor a 300 caracteres para la sección OtrMetodoPago" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7879.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'Benef': [facet 'maxLength'] The value 'ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV' has a length of '419'; this exceeds the allowed maximum length of '300'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'Benef': 'ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV ORGANIZACION RG HERMANOS, SA DE CV' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7880 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección OtrMetodoPago" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7880.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'RFC': [facet 'minLength'] The value 'ORH100325SY' has a length of '11'; this underruns the allowed minimum length of '12'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'RFC': 'ORH100325SY' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7881 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección OtrMetodopago" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7881.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'RFC': [facet 'pattern'] The value 'ORH100325SY11' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9]?[A-Z0-9]?[0-9A-Z]?'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'RFC': 'ORH100325SY11' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7883 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección OtrMetodoPago" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7883.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'Moneda': [facet 'enumeration'] The value 'ZYX' is not an element of the set {'AED', 'AFN', 'ALL', 'AMD', 'ANG', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BGN', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYR', 'BZD', 'CAD', 'CDF', 'CHF', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CSD', 'CUP', 'CUC', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HRK', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LTL', 'LVL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRO', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLL', 'SOS', 'SRD', 'STD', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'USS', 'UYU', 'UZS', 'VEF', 'VND', 'VUV', 'WST', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XDR', 'XFO', 'XFU', 'XOF', 'XPD', 'XPF', 'XPT', 'XTS', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWL'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'Moneda': 'ZYX' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogosParaEsqContE}c_Moneda'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7884 - Validar el campo Tipo de Cambio con letras para la sección OtrMetodoPago" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7884.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago', attribute 'TipCamb': 'AAAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7885 - Validar el campo Numero de Cuenta con longitudes mayores a 100 caracteres de la sección de Transacciones" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7885.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transaccion', attribute 'NumCta': [facet 'maxLength'] The value '11804000002A11804000002A11804000002A11804000002A11804000002A11804000002A11804000002A11804000002A11804000002A11804000002A' has a length of '120'; this exceeds the allowed maximum length of '100'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transaccion', attribute 'NumCta': '11804000002A11804000002A11804000002A11804000002A11804000002A11804000002A11804000002A11804000002A11804000002A11804000002A' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7887 - Validar el campo Concepto de la Cuenta con longitudes mayores a 200 caracteres de la sección de Transacciones" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7887.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transaccion', attribute 'Concepto': [facet 'maxLength'] The value 'Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar' has a length of '223'; this exceeds the allowed maximum length of '200'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transaccion', attribute 'Concepto': 'Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar Pagos pendientes de aplicar' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7888 - Validar con letras el campo Debe para la sección de Transacciones" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7888.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transaccion', attribute 'Debe': 'AAAA' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}t_Importe'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7889 - Validar con letras el campo Haber para la sección de Transacciones" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7889.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transaccion', attribute 'Haber': 'AAAA' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}t_Importe'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7889 - Validar con letras el campo Haber para la sección de Transacciones" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7889.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_poliza)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.polizas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transaccion', attribute 'Haber': 'AAAA' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}t_Importe'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end