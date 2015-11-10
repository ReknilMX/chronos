# encoding: utf-8

require "wsspec_helper"

describe "C10541 - DD - Validar que el documento digital deberá estar referenciado al namespace de acuerdo a lo especificado en el standar de documentos digitales" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10541.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, initheader = {'content-type' =>'application/vnd.sat.dpiva+xml',
                                                            'x-master-key' => '4ZU51gLxQKuvVf0u6F0Kmg==',
                                                            'x-client-id' => '1',
                                                            'x-client-rfc' => 'AAA010101AAA',
                                                            'x-auth-token' => '12312',
                                                            'x-profile-id' => '1',
                                                            'x-user-id' => '1'})
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "headers_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"})
    assert response[:message].should == "Los request headers enviados no son los requeridos"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details].should == [{:message=>"Canal no enviado", :description=>"El header X-channel es requerido, debe contener la infromacion del canal que consume el servicio"}]
    assert response[:code].should == 4351
  end

end

describe "C11215 - DD - Vaidar que el documento digital al no estar referenciado al namespace de acuerdo a los especificado en los documentos digitales" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C11215.xml")
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
    assert response[:error_details].should == [[{:message=>"El name space xsi:schemaLocation no contiene el valor esperado http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1 http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/DoctoDigital.xsd http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1 http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1/DPIVA.xsd", :field=>"xsi:schemaLocation", :code=>1450}]]
    assert response[:code].should == 4402
  end

end

describe "C10542 - DD - Validar que en caso de que la versión para el documento no sea 1.0 muestre un mensaje de error - Test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10542_test_1.xml")
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

describe "C10542 - DD - Validar que en caso de que la versión para el documento no sea 1.0 muestre un mensaje de error - Test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10542_test_2.xml")
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

describe "C10544 - DD - Validar que cuando el atributo Tipo Docto Digital este vacio muestre mensaje de validación de que es requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10544.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'TipoDoctoDigital': [facet 'length'] The value '' has a length of '0'; this differs from the allowed length of '4'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'TipoDoctoDigital': [facet 'enumeration'] The value '' is not an element of the set {'0001', '0002', '0003', '0005'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'TipoDoctoDigital': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}c_TipoDoctoDigital'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10545 - DD - Validar que cuando el atributo Tipo Docto Digital tenga valores  diferentes cat:c_tipodoctodigital a muestre mensaje de validación - Test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10545_test_1.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'TipoDoctoDigital': [facet 'enumeration'] The value '0006' is not an element of the set {'0001', '0002', '0003', '0005'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'TipoDoctoDigital': '0006' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}c_TipoDoctoDigital'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10545 - DD - Validar que cuando el atributo Tipo Docto Digital tenga valores  diferentes cat:c_tipodoctodigital a muestre mensaje de validación - Test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10545_test_2.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'TipoDoctoDigital': [facet 'enumeration'] The value 'AAAA' is not an element of the set {'0001', '0002', '0003', '0005'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'TipoDoctoDigital': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}c_TipoDoctoDigital'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10549 - DD - Validar que el atributo NumCert sea obligatorio" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10549.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'NumCert': [facet 'length'] The value '' has a length of '0'; this differs from the allowed length of '20'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'NumCert': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10551 - DD - Validar que el atributo NumCert en caso de que tenga más de 20 caracteres muestre un mensaje de error - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10551_test_1.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'NumCert': [facet 'length'] The value '200010000002000014281' has a length of '21'; this differs from the allowed length of '20'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'NumCert': '200010000002000014281' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10551 - DD - Validar que el atributo NumCert en caso de que tenga más de 20 caracteres muestre un mensaje de error - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10551_test_2.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'NumCert': [facet 'length'] The value 'AAAAAAAAAAAAAAAAAAAAAA' has a length of '22'; this differs from the allowed length of '20'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}DoctoDigital', attribute 'NumCert': 'AAAAAAAAAAAAAAAAAAAAAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10552 - DD - Validar que el atributo NumCert en caso de que  no coincida con el RFC muestre un mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10552.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, initheader = {'content-type' =>'application/vnd.sat.dpiva+xml',
                                                            'x-master-key' => '4ZU51gLxQKuvVf0u6F0Kmg==',
                                                            'x-client-id' => '6',
                                                            'x-client-rfc' => 'AAA010101AAA',
                                                            'x-auth-token' => '12312',
                                                            'x-profile-id' => '1',
                                                            'x-user-id' => '1',
                                                            'x-channel' => 'web_service'})
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "cert_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.dpiva+xml"}, {:"x-master-key"=>"4ZU51gLxQKuvVf0u6F0Kmg=="}, {:"x-client-id"=>"6"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "Certificado de emisión Invalido"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details].should == "No se encontro un certificado válido para el cliente con id: 6 con un numero de serie 20001000000200001428"
    assert response[:code].should == 4403
  end

end

describe "C10554 - DD EMI - Validar el atributo ERFC del nodo Emisor sea  requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10554.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ERFC': [facet 'minLength'] The value '' has a length of '0'; this underruns the allowed minimum length of '12'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ERFC': [facet 'pattern'] The value '' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9][A-Z0-9][0-9A]'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ERFC': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_RFC'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10555 - DD EMI - Validar que al ingresar valores del atributo ERFC del nodo con guiones o espacios muestre un mensaje de validación - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10555_test_1.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ERFC': [facet 'maxLength'] The value 'AAA-010101-AAA' has a length of '14'; this exceeds the allowed maximum length of '13'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ERFC': [facet 'pattern'] The value 'AAA-010101-AAA' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9][A-Z0-9][0-9A]'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ERFC': 'AAA-010101-AAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_RFC'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10555 - DD EMI - Validar que al ingresar valores del atributo ERFC del nodo con guiones o espacios muestre un mensaje de validación - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10555_test_2.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ERFC': [facet 'maxLength'] The value 'AAA 010101 AAA' has a length of '14'; this exceeds the allowed maximum length of '13'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ERFC': [facet 'pattern'] The value 'AAA 010101 AAA' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9][A-Z0-9][0-9A]'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ERFC': 'AAA 010101 AAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_RFC'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10556 - DD EMI - Validar que al ingresar el atributo ERFC  con letras minásculas muestre un mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10556.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ERFC': [facet 'pattern'] The value 'aaa010101aaa' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9][A-Z0-9][0-9A]'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ERFC': 'aaa010101aaa' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_RFC'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C11218 - DD EMP-Validar que el atributo ECURP no sea permitido para  persona Moral y muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C11218.xml")
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
    assert response[:error_details].should == [{
      :message=>"El campo ECURP no debe contener valor cuando ERFC es persona_moral", 
      :field=>"ECURP", 
      :code=>1450}]
    assert response[:code].should == 4402
  end

end

describe "C10558 - DD EMI - Validar que el atributo EApellPat no sea permitido para  persona Moral y muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10558.xml")
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
    assert response[:error_details].should == [{
      :message=>"El campo EApellPat no debe contener valor cuando ERFC es persona_moral", 
      :field=>"EApellPat", 
      :code=>1450}]
    assert response[:code].should == 4402
  end

end

describe "C10559 - DD EMI - Validar que  la longitud del EApellPat menor a 1 muestre un mensaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10559.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'EApellPat': [facet 'minLength'] The value '' has a length of '0'; this underruns the allowed minimum length of '1'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'EApellPat': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10560 - DD EMI - Validar que en caso de la longitud mayor a 200 del EApellPat muestre un mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10560.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'EApellPat': [facet 'maxLength'] The value 'HERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZ' has a length of '216'; this exceeds the allowed maximum length of '200'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'EApellPat': 'HERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZ' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10561 - DD EMI - Validar que el atributo ENombre  no sea requerido para Persona Moral" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10561.xml")
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
    assert response[:error_details].should == [{
      :message=>"El campo ENombre no debe contener valor cuando ERFC es persona_moral", 
      :field=>"ENombre", 
      :code=>1450}]
    assert response[:code].should == 4402
  end

end

describe "C10562 - DD EMI - Validar que el atributo Enombre al ser menor a 1 muestre un mensaje de validación para persona física" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10562.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ENombre': [facet 'minLength'] The value '' has a length of '0'; this underruns the allowed minimum length of '1'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ENombre': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10563 - DD EMI - Validar que el atributo Enombre al ser mayo a 254 caracteres muestre un mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10563.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ENombre': [facet 'maxLength'] The value 'HERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZ' has a length of '324'; this exceeds the allowed maximum length of '254'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'ENombre': 'HERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZHERNANDEZ' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10564 - DD EMI-Validar que el atrubuto EDenORazSoc al ser ingresado para persona Física Muestre un mensaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10564.xml")
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
    assert response[:error_details].should == [{
      :message=>"El campo EDenORazSoc no debe contener valor cuando ERFC es persona_fisica", 
      :field=>"EDenORazSoc", 
      :code=>1450}]
    assert response[:code].should == 4402
  end

end

describe "C10565 - DD EMI - Validar que el atributo EDenORazSoc sea menor a 1 muestre un mensaje de validación para persona Moral" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10565.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'EDenORazSoc': [facet 'minLength'] The value '' has a length of '0'; this underruns the allowed minimum length of '1'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'EDenORazSoc': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10566 - DD EMI - Validar que el atributo EDeNORazSoc sea mayor a 254 muestre un mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10566.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'EDenORazSoc': [facet 'maxLength'] The value 'TESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.V' has a length of '525'; this exceeds the allowed maximum length of '254'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1}Emisor', attribute 'EDenORazSoc': 'TESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.VTESTING IT S.A DE C.V' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10567 - DD EMI  - Validar que el atributo ECorreoE al ingresar un valor muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10567.xml")
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
    assert response[:error_details].should == [{
      :message=>"El campo ECorreoE no debe estar presente", 
      :field=>"ECorreoE", 
      :code=>1450}]
    assert response[:code].should == 4402
  end

end

describe "C10570 - DD EMI - Validar que el atributo ENumTel al ser ingresado muestre un mensaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10570.xml")
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
    assert response[:error_details].should == [{
      :message=>"El campo ENumTel no debe estar presente", 
      :field=>"ENumTel", 
      :code=>1450}]
    assert response[:code].should == 4402
  end

end

describe "C10935 - EMI - Validar que el atributo EApellMat (Persona Moral) al ingresar un valor muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10935.xml")
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
    assert response[:error_details].should == [{
      :message=>"El campo EApellPat no debe contener valor cuando ERFC es persona_moral", 
      :field=>"EApellPat", 
      :code=>1450}]
    assert response[:code].should == 4402
  end

end