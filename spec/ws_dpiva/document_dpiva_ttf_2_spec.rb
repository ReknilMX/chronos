# encoding: utf-8

require "wsspec_helper"

describe "C10748 - DPIVA - Totales - Validar que el atributo TotActPagNoPagIVA al ingresar valores diferentes a cat:t_ImporteRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10748.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotActPagNoPagIVA': 'AAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10749 - DPIVA - Totales - Validar que el atributo TotActPagNoPagIVA al ingresar valores diferentes a cat:t_ImporteRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10749.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotIVARetCont': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10751 - DPIVA - Totales - Validar que el atributo TotIVARetCont al ingresar valores diferentes a car:t:ImporteRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10751.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotIVARetCont': 'AAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10752 - DPIVA - Totales - Validar que el atributo TotIVADevDescyBonifComp sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10752.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotIVADevDescyBonifComp': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10754 - DPIVA - Totales - Validar que el atributo TotIVADevDescyBonifComp al ingresar valores diferentes a cat:t_importeRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10754.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotIVADevDescyBonifComp': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10755 - DPIVA - Totales - Validar que el atributo TotIVATraslContExcImpByS sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10755.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotIVATraslContExcImpByS': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10761 - DPIVA - Totales - Validar que el atributo TotIVAPagImpByS sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10761.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}Totales', attribute 'TotIVAPagImpByS': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd14'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10774 - DPIVA - ProvNacional - Validar que el atributo TipoOperac sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10774.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'TipoOperac': [facet 'enumeration'] The value '' is not an element of the set {'03', '06', '85'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'TipoOperac': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10776 - DPIVA - ProvNacional - Validar que el atributo TipoOperac al ingresar valores distintos a 03, 06 y 85 muestre mensaje de validación - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10776_test_1.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'TipoOperac': [facet 'enumeration'] The value '04' is not an element of the set {'03', '06', '85'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'TipoOperac': '04' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10776 - DPIVA - ProvNacional - Validar que el atributo TipoOperac al ingresar valores distintos a 03, 06 y 85 muestre mensaje de validación - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10776_test_2.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'TipoOperac': [facet 'enumeration'] The value 'AA' is not an element of the set {'03', '06', '85'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'TipoOperac': 'AA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10777 - DPIVA - ProvNacional - Validar que el atributo RFCProv sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10777.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'RFCProv': [facet 'minLength'] The value '' has a length of '0'; this underruns the allowed minimum length of '12'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'RFCProv': [facet 'pattern'] The value '' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9][A-Z0-9][0-9A]'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'RFCProv': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_RFC'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10778 - DPIVA - ProvNacional - Validar que el atributo RFCProv al ingresar guiones o espacios muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10778.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'RFCProv': [facet 'maxLength'] The value 'AAA-010101-AAA' has a length of '14'; this exceeds the allowed maximum length of '13'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'RFCProv': [facet 'pattern'] The value 'AAA-010101-AAA' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9][A-Z0-9][0-9A]'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'RFCProv': 'AAA-010101-AAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_RFC'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10779 - DPIVA - ProvNacional - Validar que el atributo RFCProv al ingresar RFC en minusculas muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10779.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'RFCProv': [facet 'pattern'] The value 'aaa010101aaa' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9][A-Z0-9][0-9A]'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'RFCProv': 'aaa010101aaa' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_RFC'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10782 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas15o16IVA al ingresar valores diferentes a cat:t_ImporteRnd12" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10782.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'ValActPagTas15o16IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10786 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas15IVA al ingresar valores diferentes a cat:t_importeRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10786.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'ValActPagTas15IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10799 - DPIVA - ProvNacional - Validar que el atributo MonIvaPagNoAcrTas15o16 al ingresar valores diferentes a cat:t_importeRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10799.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'MonIVAPagNoAcrTas15o16': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10804 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas10u11IVA al ingresar valores diferentes a cat:t_ImporteRnd12 muestre un mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10804.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'ValActPagTas10u11IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10808 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas10IVA  al ingresar valores diferentes a cat:ImporteRnd12 muestre un mensaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10808.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'ValActPagTas10IVA': 'AAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10813 - DPIVA - ProvNacional - Validar que el atributo MonIVAPagNoAcrTas10u11  al ingresar valores diferentes a cat:ImporteRnd12 muestre un mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10813.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'MonIVAPagNoAcrTas10u11': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10816 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas0IVA  al ingresar valores diferentes a cat: ImporteRnd12 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10816.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'ValActPagTas0IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10819 - DPIVA - ProvNacional - Validar que el atributo ValActPagNoIVA  al ingresar valores diferentes a cat: ImporteRnd12 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10819.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'ValActPagNoIVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10822 - DPIVA - ProvNacional - Validar que el atributo IVARetCont al ingresar valores diferentes a cat:t_importeRnd12 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10822.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'IVARetCont': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10825 - DPIVA - ProvNacional - Validar que el atributo IVADevDescyBonifComp al ingresar valores diferentes a cat:t_importeRnd12 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10825.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvNacional', attribute 'IVADevDescyBonifComp': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10827 - DPIVA - ProvExtranjero - Validar que el atributo TipoOperac sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10827.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'TipoOperac': [facet 'enumeration'] The value '' is not an element of the set {'03', '85'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'TipoOperac': '' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10829 - DPIVA - ProvExtranjero - Validar que el atributo TipoOperac al ingresar valores distintos a 03, 06 y 85 muestre mensaje de validación - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10829_test_1.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'TipoOperac': [facet 'enumeration'] The value '04' is not an element of the set {'03', '85'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'TipoOperac': '04' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10829 - DPIVA - ProvExtranjero - Validar que el atributo TipoOperac al ingresar valores distintos a 03, 06 y 85 muestre mensaje de validación - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10829_test_2.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'TipoOperac': [facet 'enumeration'] The value 'AA' is not an element of the set {'03', '85'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'TipoOperac': 'AA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10830 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10830.xml")
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
        {:message=>"El campo RFCProv, con valor  no contiene un valor válido", 
            :field=>"RFCProv", 
            :code=>1450}]]
    assert response[:code].should == 4402
  end

end

describe "C10831 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv al ingresar guiones o espacios muestre mensaje de validación - test - 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10831_test_1.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'RFCProv': [facet 'maxLength'] The value 'AAA-010101-AAA' has a length of '14'; this exceeds the allowed maximum length of '13'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'RFCProv': [facet 'pattern'] The value 'AAA-010101-AAA' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9][A-Z0-9][0-9A]'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'RFCProv': 'AAA-010101-AAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_RFC'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10831 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv al ingresar guiones o espacios muestre mensaje de validación - test - 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10831_test_2.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'RFCProv': [facet 'maxLength'] The value 'AAA 010101 AAA' has a length of '14'; this exceeds the allowed maximum length of '13'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'RFCProv': [facet 'pattern'] The value 'AAA 010101 AAA' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9][A-Z0-9][0-9A]'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'RFCProv': 'AAA 010101 AAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_RFC'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10832 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv al ingresar RFC en minusculas muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10832.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'RFCProv': [facet 'pattern'] The value 'aaa010101aaa' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9][A-Z0-9][0-9A]'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'RFCProv': 'aaa010101aaa' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_RFC'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10839 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas15IVA al ingresar valores diferentes a cat:t_importeRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10839.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'ValActPagTas15IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10842 - DPIVA - ProvExtranjero - Validar que el atributo MonIvaPagNoAcrTas15o16 al ingresar valores diferentes a cat:t_importeRnd14 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10842.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'MonIVAPagNoAcrTas15o16': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10847 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas10u11IVA al ingresar valores diferentes a cat:t_ImporteRnd12 muestre un mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10847.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'ValActPagTas10u11IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10851 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas10IVA  al ingresar valores diferentes a cat:ImporteRnd12 muestre un mensaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10851.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'ValActPagTas10IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10856 - DPIVA - ProvExtranjero - Validar que el atributo MonIVAPagNoAcrTas10u11  al ingresar valores diferentes a cat:ImporteRnd12 muestre un mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10856.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'MonIVAPagNoAcrTas10u11': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10859 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas0IVA  al ingresar valores diferentes a cat: ImporteRnd12 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10859.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'ValActPagTas0IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10862 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagNoIVA  al ingresar valores diferentes a cat: ImporteRnd12 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10862.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'ValActPagNoIVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10865 - DPIVA - ProvExtranjero - Validar que el atributo IVARetCont al ingresar valores diferentes a cat:t_importeRnd12 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10865.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'IVARetCont': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10868 - DPIVA - ProvExtranjero - Validar que el atributo IVADevDescyBonifComp al ingresar valores diferentes a cat:t_importeRnd12 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10868.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'IVADevDescyBonifComp': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10872 - DPIVA - ProvExtranjero - Validar que el atributo NumIDFiscal si la longitud > 40 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10872.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'NumIDFiscal': [facet 'maxLength'] The value '123456789123456789121234567891234567891212345678912345678912' has a length of '60'; this exceeds the allowed maximum length of '40'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'NumIDFiscal': '123456789123456789121234567891234567891212345678912345678912' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10873 - DPIVA - ProvExtranjero - Validar que el atributo NombExtranjero sea requerido y muestre mansaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10873.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero': The attribute 'NombExtranjero' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10875 - DPIVA - ProvExtranjero - Validar que el atributo NombExtranjero si la longitud > 43 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10875.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'NombExtranjero': [facet 'maxLength'] The value 'Andrei Tkatchenko Andrei Tkatchenko Andrei Tkatchenko Andrei Tkatchenko Andrei Tkatchenko' has a length of '89'; this exceeds the allowed maximum length of '43'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'NombExtranjero': 'Andrei Tkatchenko Andrei Tkatchenko Andrei Tkatchenko Andrei Tkatchenko Andrei Tkatchenko' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10876 - DPIVA - ProvExtranjero - Validar que el atributo PaisDeResidencia sea requerido y muestre mensaje de validación - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10876_test_1.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero': The attribute 'PaisResidencia' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10876 - DPIVA - ProvExtranjero - Validar que el atributo PaisDeResidencia sea requerido y muestre mensaje de validación - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10876_test_2.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'PaisResidencia': [facet 'length'] The value '' has a length of '0'; this differs from the allowed length of '2'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'PaisResidencia': [facet 'enumeration'] The value '' is not an element of the set {'AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NI', 'NL', 'NO', 'NP', 'NR', 'NU', 'NZ', 'OM', 'PA', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PW', 'PY', 'QA', 'RE', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WS', 'YE', 'YT', 'ZA', 'ZM', 'ZW', 'ZZ'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'PaisResidencia': '' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}c_Pais'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10877 - DPIVA - ProvExtranjero - Validar que el atributo PaisDeResidencia al ingresar valores diferentes a lo de Cat : c_pais muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10877.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'PaisResidencia': [facet 'length'] The value 'XXX' has a length of '3'; this differs from the allowed length of '2'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'PaisResidencia': [facet 'enumeration'] The value 'XXX' is not an element of the set {'AD', 'AE', 'AF', 'AG', 'AI', 'AL', 'AM', 'AO', 'AQ', 'AR', 'AS', 'AT', 'AU', 'AW', 'AX', 'AZ', 'BA', 'BB', 'BD', 'BE', 'BF', 'BG', 'BH', 'BI', 'BJ', 'BL', 'BM', 'BN', 'BO', 'BQ', 'BR', 'BS', 'BT', 'BV', 'BW', 'BY', 'BZ', 'CA', 'CC', 'CD', 'CF', 'CG', 'CH', 'CI', 'CK', 'CL', 'CM', 'CN', 'CO', 'CR', 'CU', 'CV', 'CW', 'CX', 'CY', 'CZ', 'DE', 'DJ', 'DK', 'DM', 'DO', 'DZ', 'EC', 'EE', 'EG', 'EH', 'ER', 'ES', 'ET', 'FI', 'FJ', 'FK', 'FM', 'FO', 'FR', 'GA', 'GB', 'GD', 'GE', 'GF', 'GG', 'GH', 'GI', 'GL', 'GM', 'GN', 'GP', 'GQ', 'GR', 'GS', 'GT', 'GU', 'GW', 'GY', 'HK', 'HM', 'HN', 'HR', 'HT', 'HU', 'ID', 'IE', 'IL', 'IM', 'IN', 'IO', 'IQ', 'IR', 'IS', 'IT', 'JE', 'JM', 'JO', 'JP', 'KE', 'KG', 'KH', 'KI', 'KM', 'KN', 'KP', 'KR', 'KW', 'KY', 'KZ', 'LA', 'LB', 'LC', 'LI', 'LK', 'LR', 'LS', 'LT', 'LU', 'LV', 'LY', 'MA', 'MC', 'MD', 'ME', 'MF', 'MG', 'MH', 'MK', 'ML', 'MM', 'MN', 'MO', 'MP', 'MQ', 'MR', 'MS', 'MT', 'MU', 'MV', 'MW', 'MX', 'MY', 'MZ', 'NA', 'NC', 'NE', 'NF', 'NG', 'NI', 'NL', 'NO', 'NP', 'NR', 'NU', 'NZ', 'OM', 'PA', 'PE', 'PF', 'PG', 'PH', 'PK', 'PL', 'PM', 'PN', 'PR', 'PS', 'PT', 'PW', 'PY', 'QA', 'RE', 'RO', 'RS', 'RU', 'RW', 'SA', 'SB', 'SC', 'SD', 'SE', 'SG', 'SH', 'SI', 'SJ', 'SK', 'SL', 'SM', 'SN', 'SO', 'SR', 'SS', 'ST', 'SV', 'SX', 'SY', 'SZ', 'TC', 'TD', 'TF', 'TG', 'TH', 'TJ', 'TK', 'TL', 'TM', 'TN', 'TO', 'TR', 'TT', 'TV', 'TW', 'TZ', 'UA', 'UG', 'UM', 'US', 'UY', 'UZ', 'VA', 'VC', 'VE', 'VG', 'VI', 'VN', 'VU', 'WF', 'WS', 'YE', 'YT', 'ZA', 'ZM', 'ZW', 'ZZ'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'PaisResidencia': 'XXX' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}c_Pais'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10878 - DPIVA - ProvExtranjero - Validar que el atributo Nacionalidad sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10878.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero': The attribute 'Nacionalidad' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10880 - DPIVA - ProvExtranjero - Validar que el atributo Nacionalidad si la longitud > 40 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10880.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'Nacionalidad': [facet 'maxLength'] The value 'AAAAAAAAAABBBBBBBBBBCCCCCCCCCCDDDDDDDDDDEEEEEEEEEE' has a length of '50'; this exceeds the allowed maximum length of '40'.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvExtranjero', attribute 'Nacionalidad': 'AAAAAAAAAABBBBBBBBBBCCCCCCCCCCDDDDDDDDDDEEEEEEEEEE' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10882 - DPIVA - ProvGlobal - Validar que el atributo TipoOperac sea requerido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10882.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvGlobal': The attribute 'TipoOperac' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10884 - DPIVA - ProvGlobal - Validar que el atributo TipoOperac al ingresar valores distintos a 03, 06 y 85 muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10884.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvGlobal', attribute 'TipoOperac': [facet 'enumeration'] The value '04' is not an element of the set {'03', '06', '85'}.Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvGlobal', attribute 'TipoOperac': '04' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C10887 - DPIVA - ProvGlobal - Validar que el atributo ValActPagTas15o16IVA al ingresar valores diferentes a cat:t_ImporteRnd12" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10887.xml")
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
    assert response[:error_details][:message].should == "Element '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/TipoDPIVA/1}ProvGlobal', attribute 'ValActPagTas15o16IVA': 'AAAA' is not a valid value of the atomic type '{http://esquemas.clouda.sat.gob.mx/archivos/DoctosDigitales/1/Catalogos}t_ImporteRnd12'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end