# encoding: utf-8

require "wsspec_helper"

describe "C11239 - DPIVA - Validar que si el documento digital no esta referenciado al namespace de acuerdo a lo especificado muestre un mensaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C11239.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "content_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el contenido definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details].should == [[
        {:message=>"El name space xsi:schemaLocation no contiene el valor esperado http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1 http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/DoctoDigital.xsd http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1 http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1/DPIVA.xsd", 
            :field=>"xsi:schemaLocation", 
            :code=>1450}]]
    assert response[:code].should == 4402
  end

end

describe "C10671 - DPIVA - Validar que en caso de que la versión para el documento no sea 1.0 muestre un mensaje de error - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10671_test_1.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'Version': The value '2.0' does not match the fixed value constraint '1.0'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10671 - DPIVA - Validar que en caso de que la versión para el documento no sea 1.0 muestre un mensaje de error - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10671_test_2.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'Version': The value 'AAA' does not match the fixed value constraint '1.0'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10672 - DPIVA - Validar que en caso de que la versión para el documento este vacio un mensaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10672.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'Version': The value '' does not match the fixed value constraint '1.0'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10543 - DPIVA - Validar que cuando el atributo Ejercicio este vacío muestre mensaje de validación indicando que es un campo requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10543.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'Ejercicio': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10643 - DPIVA - Validar que cuando el atributo Ejercicio sea menor a 2015  muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10643.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'Ejercicio': [facet 'minInclusive'] The value '2014' is less than the minimum value allowed ('2015').Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'Ejercicio': '2014' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10644 - DPIVA - Validar que cuando el atributo Ejercicio tenga valores diferentes a enteros muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10644.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'Ejercicio': 'AAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10673 - DPIVA - Validar que cuando el atributo TipoPerid este vacío muestre un mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10673.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoPerid': [facet 'length'] The value '' has a length of '0'; this differs from the allowed length of '2'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoPerid': [facet 'enumeration'] The value '' is not an element of the set {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoPerid': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10674 - DPIVA - Validar que cuando el atributo TipoPerid tenga valores que no esten dentro del cat: c_peridicidad muestre un mensaje de validación - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10674_test_1.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoPerid': [facet 'enumeration'] The value '11' is not an element of the set {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoPerid': '11' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10674 - DPIVA - Validar que cuando el atributo TipoPerid tenga valores que no esten dentro del cat: c_peridicidad muestre un mensaje de validación - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10674_test_2.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoPerid': [facet 'length'] The value 'AAA' has a length of '3'; this differs from the allowed length of '2'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoPerid': [facet 'enumeration'] The value 'AAA' is not an element of the set {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoPerid': 'AAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10674 - DPIVA - Validar que cuando el atributo TipoPerid tenga valores que no esten dentro del cat: c_peridicidad muestre un mensaje de validación - test 3" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10674_test_3.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoPerid': [facet 'length'] The value '3.45' has a length of '4'; this differs from the allowed length of '2'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoPerid': [facet 'enumeration'] The value '3.45' is not an element of the set {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoPerid': '3.45' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10675 - DPIVA - Validar que cuando el atributo DPIVA este vacío muestre un mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10675.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'DPIVA': [facet 'enumeration'] The value '' is not an element of the set {'1', '0'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'DPIVA': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10676 - DPIVA - Validar cuando el atributo DPIVA no este dentro de los valores permitidos (0 y 1) - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10676_test_1.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'DPIVA': [facet 'enumeration'] The value '2' is not an element of the set {'1', '0'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'DPIVA': '2' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10676 - DPIVA - Validar cuando el atributo DPIVA no este dentro de los valores permitidos (0 y 1) - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10676_test_2.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'DPIVA': [facet 'enumeration'] The value 'AAA' is not an element of the set {'1', '0'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'DPIVA': 'AAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10677 - DPIVA - Validar cuando el atributo DPIVA = 0 al ingresar Nodos ProvNacional, ProvExtranjero, ProvGlobal muestre mensaje de validación." do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10677.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "content_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el contenido definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details].should == [
        {:message=>"El nodo ProvNacional no debe estar presente cuando DPIVA es sin_operaciones", 
        :field=>"ProvNacional", 
        :code=>1450}, 
        {:message=>"El nodo ProvGlobal no debe estar presente cuando DPIVA es sin_operaciones", 
        :field=>"ProvGlobal", 
        :code=>1450}, 
        {:message=>"El nodo ProvExtranjero no debe estar presente cuando DPIVA es sin_operaciones", 
        :field=>"ProvExtranjero", 
        :code=>1450}]
    assert response[:code].should == 4402
  end

end

describe "C11243 - DPIVA - Validar cuando el atributo DPIVA = 1 ingresar al menos 1 nodo  ProvNacional, ProvExtranjero, ProvGlobal y montos iguales a 0 de los elementos que integren el nodo muestre mensaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10677.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "content_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el contenido definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details]. should == [
        {:message=>"El nodo ProvNacional no debe estar presente cuando DPIVA es sin_operaciones", 
            :field=>"ProvNacional", 
            :code=>1450}, 
        {:message=>"El nodo ProvGlobal no debe estar presente cuando DPIVA es sin_operaciones", 
            :field=>"ProvGlobal", 
            :code=>1450}, 
        {:message=>"El nodo ProvExtranjero no debe estar presente cuando DPIVA es sin_operaciones", 
            :field=>"ProvExtranjero", 
            :code=>1450}]
    assert response[:code].should == 4402
  end

end

describe "C10679 - DPIVA - Validar cuando el atributo TipoDec esta vacío muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10679.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoDec': [facet 'enumeration'] The value '' is not an element of the set {'1', '2'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoDec': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10680 - DPIVA - Validar cuando el atributo TipoDec  no esta dentro de los valores permitidos 1 y 2 muestre mensaje de error - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10680_test_1.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoDec': [facet 'enumeration'] The value '3' is not an element of the set {'1', '2'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoDec': '3' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10680 - DPIVA - Validar cuando el atributo TipoDec  no esta dentro de los valores permitidos 1 y 2 muestre mensaje de error - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10680_test_2.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoDec': [facet 'enumeration'] The value 'AAA' is not an element of the set {'1', '2'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'TipoDec': 'AAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10684 - DPIVA - Validar que el atributo Folio Ant cuando la longitud = 0 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10684.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'FolioAnt': [facet 'minLength'] The value '' has a length of '0'; this underruns the allowed minimum length of '1'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'FolioAnt': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10685 - DPIVA - Validar que el atributo Folio Ant cuando la longitud > 15 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10685.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'FolioAnt': [facet 'maxLength'] The value 'ABC001123456789' has a length of '15'; this exceeds the allowed maximum length of '14'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'FolioAnt': 'ABC001123456789' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10688 - DPIVA - Validar que el atributo FechaPresAnt sea requerida si el TipoDec = 2 y muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10688.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'FechPresAnt': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10689 - DPIVA - Validar que el atributo FechaPresAnt al no ser de tipo Date muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10689.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'FechPresAnt': 'AAAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10690 - DPIVA - Validar que el atributo FechaPresAnt al no ser de tipo Date < 2007-01-01 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10690.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA', attribute 'FechPresAnt': '2016-31-12' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10691 - DPIVA - Totales - Validar que el nodo Totales sea obligatorio" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10691.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}DPIVA': Missing child element(s). Expected is ( {http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales )."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10692 - DPIVA - Totales - Validar que el atributo TotOperac sea requerido , mostrando mensaje de validación si esta vacio" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10692.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotOperac': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10693 - DPIVA - Totales - Validar que el atributo TotOperac muestre mensaje de error si tiene valores diferentes a 7 enteros sin decimales - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10693_test_1.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotOperac': '6666823.01' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10693 - DPIVA - Totales - Validar que el atributo TotOperac muestre mensaje de error si tiene valores diferentes a 7 enteros sin decimales - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10693_test_2.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotOperac': 'AAAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10694 - DPIVA - Totales - Validar que el atributoï TotActPAgTas15o16IVA sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10694.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagTas15o16IVA': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10696 - DPIVA - Totales - Validar que el atributoTotActPAgTas15IVA  tenga un valor cuando el ejercicio = 2010 , tipo periocidad = mensual, y el periodo = enero sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10696.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagTas15IVA': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10698 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrTas15o16  al no ser ingresado muestre mensaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10698.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotIVAPagNoAcrTas15o16': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C11246 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrTas15o16 sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C11246.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales': The attribute 'TotIVAPagNoAcrTas15o16' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10700 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrTas15o16 al ingresar valores diferentes al cat:t_ImporteRnd14" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10700.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotIVAPagNoAcrTas15o16': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10701 - DPIVA - Totales - Validar que el atributo TotActPagTas11o10IVA muestre mensaje de error al estar vacio cuando Ejercicio <= 2013 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10701_test_1.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagTas10u11IVA': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10701 - DPIVA - Totales - Validar que el atributo TotActPagTas11o10IVA muestre mensaje de error al estar vacio cuando Ejercicio <= 2013 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10701_test_2.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagTas10u11IVA': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10702 - DPIVA- Totales - Validar que el atributo TotActPagTas11o10IVA muestre mensaje de error al estar vacio cuando Ejercicio = 2014 si  Periodicidad = mensual y Periodo = Enero." do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10702.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagTas10u11IVA': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10705 - DPIVA - Totales - Validar que el atributo TotActPagTas10IVA sea requerido, mostrando mensaje de validación si esta vacío" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10705.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagTas10IVA': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10709 - DPIVA - Totales - Validar que el atributo TotActPagTas10IVA tenga 0 al ingresar valores diferentes a cat:t_importeRnd14 muestre mensaje de validacion" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10709.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagTas10IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10710 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrTas10u11 sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10710.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotIVAPagNoAcrTas10u11': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10714 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrTas10u11 al ingresar valores diferentes al cat:t_ImporteRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10714.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotIVAPagNoAcrTas10u11': 'AAAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10719 - DPIVA - Totales - Validar que el atributo TotActPagImpBySTas15o16IVA sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10719.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagImpBySTas15o16IVA': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10721 - DPIVA - Totales - Validar que el atributo TotActPagImpBySTas15o16IVA al ingresar valores diferentes al cat:t_importeRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10721.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagImpBySTas15o16IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10723 - DPIVA - Totales - Validar que el atributo TotActPagImpBySTas10o11IVA sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10723.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagImpBySTas10u11IVA': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10727 - DPIVA - Totales - Validar que el atributo TotActPagImpBySTas10o11IVA al ingresar valores diferentes al cat:t_ImporteRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10727.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagImpBySTas10u11IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10739 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrImpTas10u11 al ingresar valores diferentes al cat:t_ImporteRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10739.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotIVAPagNoAcrImpTas10u11': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10740 - DPIVA - Totales - Validar que el atributo TotActPagImpBySNoPagIVA sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10740.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagImpBySNoPagIVA': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10742 - DPIVA - Totales - Validar que el atributo TotDemActPagTas0IVA requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10742.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotDemActPagTas0IVA': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10743 - DPIVA - Totales - Validar que el atributo TotActPagImpBySNoPagIVA al ingresar valores diferentes al cat:t_ImporteRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10743.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagImpBySNoPagIVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10745 - DPIVA - Totales - Validar que el atributo TotDemActPagTas0IVA permita al ingresar valores diferentes a cat:t_ImporteRnd14 muestre mensaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10745.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotDemActPagTas0IVA': 'AAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10746 - DPIVA - Totales - Validar que el atributo TotActPagNoPagIVA sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10746.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagNoPagIVA': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end