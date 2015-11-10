# encoding: utf-8

require "wsspec_helper"

describe "C7790 - Validar que campo Mes sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7790.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas': The attribute 'Mes' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7791 - Validar que el campo Año sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7791.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas': The attribute 'Anio' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7792 - Validar el campo tipo de Solicitud sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7792.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas': The attribute 'TipoSolicitud' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7793 - Validar que el campo Numero de Orden sea requerido cuando el campo Tipo de Solicitud sea AF" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7793.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas': The attribute 'NumOrden' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7794 - Validar que el campo Numero de Orden sea requerido cuando el campo Tipo de Solicitud sea FC" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7794.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas': The attribute 'NumOrden' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7795 - Validar que el campo NumTramite sea requerido cuando el Tipo de Solicitud sea DE" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7795.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas': The attribute 'NumTramite' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7796 - Validar que el campo NumTramite sea requerido cuando el Tipo de Solicitud sea CO" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7796.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas': The attribute 'NumTramite' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7797 - Validar que el campo UUID de la sección CompNal sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7797.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal': The attribute 'UUID_CFDI' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7798 - Validar que el campo RFC de la sección CompNal sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7798.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal': The attribute 'RFC' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7799 - Validar que el campo Monto de la sección CompNal sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7799.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal': The attribute 'MontoTotal' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7800 - Validar que el campo CCB Número de Folio de la sección CompNalOtr sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7800.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr': The attribute 'CFD_CBB_NumFol' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7801 - Validar que el campo RFC de la sección CompNalOtr sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7801.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr': The attribute 'RFC' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7802 - Validar que el campo Monto de la sección CompNalOtr sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7802.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr': The attribute 'MontoTotal' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7803 - Validar que el campo Numero de Comprobante Extranjero de la sección CompExt sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7803.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompExt': The attribute 'NumFactExt' is required but missing."
    assert nil == response[:error_details][:field]
    assert 1450 == response[:error_details][:code]
    assert response[:code].should == 4401
  end

end

describe "C7804 - Validar que el campo Monto de la sección CompExt sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7804.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompExt': The attribute 'MontoTotal' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7805 - Validar que el campo Número de Cheque de la sección Cheque sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7805.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque': The attribute 'Num' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7806 - Validar que el campo Banco Emisor Nal de la sección Cheque sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7806.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque': The attribute 'BanEmisNal' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7807 - Validar que el campo Cuenta Origen de la sección Cheque sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7807.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque': The attribute 'CtaOri' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7808 - Validar que el campo Fecha de la sección Cheque sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7808.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque': The attribute 'Fecha' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7809 - Validar que el campo Beneficiario de la sección Cheque sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7809.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque': The attribute 'Benef' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7810 - Validar que el campo RFC de la sección Cheque sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7810.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque': The attribute 'RFC' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7811 - Validar que el campo Monto de la sección Cheque sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7811.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Cheque': The attribute 'Monto' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7812 - Validar que el campo Banco Origen Nacional de la sección Transferencia sea requerido para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7812.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia': The attribute 'BancoOriNal' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7813 - Validar que el campo Cuenta destino de la sección Transferencia sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7813.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia': The attribute 'CtaDest' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7814 - Validar que el campo Banco Destino Nacional de la sección de Transferencia sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7814.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia': The attribute 'BancoDestNal' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7815 - Validar que el campo Fecha de la sección de Transferencia sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7815.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia': The attribute 'Fecha' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7816 - Validar que el campo Beneficiario de la sección de Transferencia sea requerido para el archivo de Polizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7816.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia': The attribute 'Benef' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7817 - Validar que el campo RFC de la sección de Transferencia sea requerido para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7817.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia': The attribute 'RFC' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7818 - Validar que el campo Monto de la sección de Transferencia sea requerido para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7818.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Transferencia': The attribute 'Monto' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7819 - Validar que el campo Método de Pago de la sección de Otro Método de Pago sea requerido para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7819.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago': The attribute 'MetPagoPol' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7820 - Validar que el campo Fecha de la sección Otro Método de Pago sea requerido para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7820.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago': The attribute 'Fecha' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7821 - Validar que el campo Beneficiario de la sección Otro Método de Pago sea requerido para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7821.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago': The attribute 'Benef' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7822 - Validar que el campo RFC de la sección Otro Método de Pago sea requerido para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7822.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago': The attribute 'RFC' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7823 - Validar que el campo Monto de la sección Otro Método de Pago sea requerido para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7823.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}OtrMetodoPago': The attribute 'Monto' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7824 - Validar que el campo mes con valores mayores a 12 para la sección de Generales para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7824.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'Mes': [facet 'enumeration'] The value '14' is not an element of the set {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'Mes': '14' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7825 - Valiadar el campo año con valores menores a 2015 en la sección de Generales para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7825.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'Anio': [facet 'minInclusive'] The value '2014' is less than the minimum value allowed ('2015').Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'Anio': '2014' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7826 - Validar que el campo Tipo de Solicitud con valores distintos a AF|FC|DE|CO para la sección de Generales para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7826.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'TipoSolicitud': [facet 'pattern'] The value 'AA' is not accepted by the pattern 'AF|FC|DE|CO'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'TipoSolicitud': 'AA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7827 - Validar el campo Número de Orden con una longitud mayor a 13 caracteres para la sección de Generales para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7827.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'NumOrden': [facet 'length'] The value 'ABC0012345/011' has a length of '14'; this differs from the allowed length of '13'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'NumOrden': [facet 'pattern'] The value 'ABC0012345/011' is not accepted by the pattern '[A-Z]{3}[0-6][0-9][0-9]{5}(/)[0-9]{2}'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'NumOrden': 'ABC0012345/011' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7828 - Validar el campo Numero de Orden con caracteres especiales para la sección de Generales para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7828.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'NumOrden': [facet 'pattern'] The value 'ABC0012345%01' is not accepted by the pattern '[A-Z]{3}[0-6][0-9][0-9]{5}(/)[0-9]{2}'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'NumOrden': 'ABC0012345%01' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7829 - Validar el campo Número de Trámite con longitud mayor a 10 para la sección de Generales para el archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7829.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'NumTramite': [facet 'length'] The value '47721234561' has a length of '11'; this differs from the allowed length of '10'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'NumTramite': [facet 'pattern'] The value '47721234561' is not accepted by the pattern '[0-9]{10}'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}Polizas', attribute 'NumTramite': '47721234561' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7830 - Validar el campo UUID con una longitud mayor a 36 caracteres para la sección de CompNal del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7830.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'UUID_CFDI': [facet 'length'] The value '11c7a692-f2e8-4a72-b78a-b305445253cf123' has a length of '39'; this differs from the allowed length of '36'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'UUID_CFDI': [facet 'pattern'] The value '11c7a692-f2e8-4a72-b78a-b305445253cf123' is not accepted by the pattern '[a-f0-9A-F]{8}-[a-f0-9A-F]{4}-[a-f0-9A-F]{4}-[a-f0-9A-F]{4}-[a-f0-9A-F]{12}'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'UUID_CFDI': '11c7a692-f2e8-4a72-b78a-b305445253cf123' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7831 - Validar el campo RFC con una longitud mayor a 13 caracteres para la sección CompNal del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7831.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'RFC': [facet 'pattern'] The value 'ORH100325SY11' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9]?[A-Z0-9]?[0-9A-Z]?'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'RFC': 'ORH100325SY11' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7832 - Validar el campo RFC con una longitud menor a 12 caracteres para la sección CompNal del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7832.xml")
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

describe "C7834 - Validar el campo Moneda con valores distintos a los del catálogo definido por el SAT para la sección CompNal" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7834.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'Moneda': [facet 'enumeration'] The value 'XYZ' is not an element of the set {'AED', 'AFN', 'ALL', 'AMD', 'ANG', 'AOA', 'ARS', 'AUD', 'AWG', 'AZN', 'BAM', 'BBD', 'BDT', 'BGN', 'BHD', 'BIF', 'BMD', 'BND', 'BOB', 'BOV', 'BRL', 'BSD', 'BTN', 'BWP', 'BYR', 'BZD', 'CAD', 'CDF', 'CHF', 'CLF', 'CLP', 'CNY', 'COP', 'COU', 'CRC', 'CSD', 'CUP', 'CUC', 'CVE', 'CZK', 'DJF', 'DKK', 'DOP', 'DZD', 'EGP', 'ERN', 'ETB', 'EUR', 'FJD', 'FKP', 'GBP', 'GEL', 'GHS', 'GIP', 'GMD', 'GNF', 'GTQ', 'GYD', 'HKD', 'HNL', 'HRK', 'HTG', 'HUF', 'IDR', 'ILS', 'INR', 'IQD', 'IRR', 'ISK', 'JMD', 'JOD', 'JPY', 'KES', 'KGS', 'KHR', 'KMF', 'KPW', 'KRW', 'KWD', 'KYD', 'KZT', 'LAK', 'LBP', 'LKR', 'LRD', 'LSL', 'LTL', 'LVL', 'LYD', 'MAD', 'MDL', 'MGA', 'MKD', 'MMK', 'MNT', 'MOP', 'MRO', 'MUR', 'MVR', 'MWK', 'MXN', 'MXV', 'MYR', 'MZN', 'NAD', 'NGN', 'NIO', 'NOK', 'NPR', 'NZD', 'OMR', 'PAB', 'PEN', 'PGK', 'PHP', 'PKR', 'PLN', 'PYG', 'QAR', 'RON', 'RUB', 'RWF', 'SAR', 'SBD', 'SCR', 'SDG', 'SEK', 'SGD', 'SHP', 'SLL', 'SOS', 'SRD', 'STD', 'SYP', 'SZL', 'THB', 'TJS', 'TMT', 'TND', 'TOP', 'TRY', 'TTD', 'TWD', 'TZS', 'UAH', 'UGX', 'USD', 'USN', 'USS', 'UYU', 'UZS', 'VEF', 'VND', 'VUV', 'WST', 'XAF', 'XAG', 'XAU', 'XBA', 'XBB', 'XBC', 'XBD', 'XCD', 'XDR', 'XFO', 'XFU', 'XOF', 'XPD', 'XPF', 'XPT', 'XTS', 'XXX', 'YER', 'ZAR', 'ZMW', 'ZWL'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'Moneda': 'XYZ' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogosParaEsqContE}c_Moneda'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7835 - Validar el campo Monto con letras para la sección CompNal del Archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7835.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'MontoTotal': 'AAAA' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}t_Importe'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7836 - Validar el campo Tipo de Cambio con letras para la sección Comp Nal del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7836.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'TipCamb': 'AAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7837 - Validar el campo con cantidades mayores a 20 digitos y 6 decimales para la sección Comp Nal del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7837.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'TipCamb': [facet 'fractionDigits'] The value '123.123456' has more fractional digits than are allowed ('5').Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNal', attribute 'TipCamb': '123.123456' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7838 - Validar el campo CBB- Serie con una longitud mayor a 10 para al sección de CompNalOtr de la sección de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7838.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr', attribute 'CFD_CBB_Serie': [facet 'maxLength'] The value 'HGS12345678' has a length of '11'; this exceeds the allowed maximum length of '10'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr', attribute 'CFD_CBB_Serie': [facet 'pattern'] The value 'HGS12345678' is not accepted by the pattern '[A-Z]+'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr', attribute 'CFD_CBB_Serie': 'HGS12345678' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7839 - Validar el campo CBB-Folio con letras para la sección CompNalOtr de la sección Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7839.xml")
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

describe "C7840 - Validar el campo CBB Número de Folio con una longitud mayor a 20 para la sección CompNal del archivo de Pólizas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/poliza/polizas_C7840.xml")
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
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr', attribute 'CFD_CBB_NumFol': [facet 'totalDigits'] The value '123456789123456789123' has more digits than are allowed ('20').Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/PolizasPeriodo}CompNalOtr', attribute 'CFD_CBB_NumFol': '123456789123456789123' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end