# encoding: utf-8

require "wsspec_helper"

describe "C7898 - Validar que el campo Mes sea requerido para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7898.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo': The attribute 'Mes' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7899 - Validar que el campo Año sea requerido para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7899.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo': The attribute 'Anio' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7900 - Validar que el campo Código Agrupador sea requerido para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7900.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas': The attribute 'CodAgrup' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7901 - Validar que campo Numero de Cuenta sea requerido para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7901.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas': The attribute 'NumCta' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7902 - Validar que el campo Nivel sea requerido para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7902.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas': The attribute 'Nivel' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7903 - Validar que el campo Naturaleza sea requerido para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7903.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas': The attribute 'Natur' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7904 - Validar que el campo Descripción sea requerido para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7904.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas': The attribute 'Desc' is required but missing."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7905 - Validar valores mayores a 13 en el campo Mes muestre mensaje para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7905.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'Mes': [facet 'enumeration'] The value '13' is not an element of the set {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'Mes': '13' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7906 - Validar valores menores al 2015 en el campo Año para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7906.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'Anio': [facet 'minInclusive'] The value '2014' is less than the minimum value allowed ('2015').Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'Anio': '2014' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7907 - Validar letras en el campo Mes para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7907.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'Mes': [facet 'enumeration'] The value 'AA' is not an element of the set {'01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'Mes': 'AA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7908 - Validar letras en el campo Año para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7908.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'Anio': 'AAAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7909 - Validar valores distintos en el campo Código Agrupador a los definidos por el SAT para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7909.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'CodAgrup': [facet 'enumeration'] The value 'XXX' is not an element of the set {'000', '100', '100.01', '101', '101.01', '102', '102.01', '102.02', '103', '103.01', '103.02', '103.03', '104', '104.01', '105', '105.01', '105.02', '105.03', '105.04', '106', '106.01', '106.02', '106.03', '106.04', '106.05', '106.06', '106.07', '106.08', '106.09', '106.10', '107', '107.01', '107.02', '107.03', '107.04', '107.05', '108', '108.01', '108.02', '108.03', '108.04', '109', '109.01', '109.02', '109.03', '109.04', '109.05', '109.06', '109.07', '109.08', '109.09', '109.10', '109.11', '109.12', '109.13', '109.14', '109.15', '109.16', '109.17', '109.18', '109.19', '109.20', '109.21', '109.22', '109.23', '110', '110.01', '111', '111.01', '112', '112.01', '113', '113.01', '113.02', '113.03', '113.04', '113.05', '113.06', '113.07', '113.08', '114', '114.01', '115', '115.01', '115.02', '115.03', '115.04', '115.05', '115.06', '115.07', '116', '116.01', '117', '117.01', '118', '118.01', '118.02', '118.03', '118.04', '119', '119.01', '119.02', '119.03', '119.04', '120', '120.01', '120.02', '120.03', '120.04', '121', '121.01', '100.02', '151', '151.01', '152', '152.01', '153', '153.01', '154', '154.01', '155', '155.01', '156', '156.01', '157', '157.01', '158', '158.01', '159', '159.01', '160', '160.01', '161', '161.01', '162', '162.01', '163', '163.01', '164', '164.01', '165', '165.01', '166', '166.01', '167', '167.01', '168', '168.01', '169', '169.01', '170', '170.01', '171', '171.01', '171.02', '171.03', '171.04', '171.05', '171.06', '171.07', '171.08', '171.09', '171.10', '171.11', '171.12', '171.13', '171.14', '171.15', '171.16', '171.17', '171.18', '172', '172.01', '172.02', '172.03', '172.04', '172.05', '172.06', '172.07', '172.08', '172.09', '172.10', '172.11', '172.12', '172.13', '172.14', '172.15', '172.16', '172.17', '172.18', '173', '173.01', '174', '174.01', '175', '175.01', '176', '176.01', '177', '177.01', '178', '178.01', '179', '179.01', '180', '180.01', '181', '181.01', '182', '182.01', '183', '183.01', '183.02', '183.03', '183.04', '183.05', '183.06', '183.07', '183.08', '183.09', '183.10', '184', '184.01', '184.02', '184.03', '185', '185.01', '186', '186.01', '186.02', '186.03', '186.04', '186.05', '186.06', '186.07', '186.08', '186.09', '186.10', '187', '187.01', '188', '188.01', '188.02', '188.03', '189', '189.01', '190', '190.01', '191', '191.01', '200', '200.01', '201', '201.01', '201.02', '201.03', '201.04', '202', '202.01', '202.02', '202.03', '202.04', '202.05', '202.06', '202.07', '202.08', '202.09', '202.10', '202.11', '202.12', '203', '203.01', '203.02', '203.03', '203.04', '203.05', '203.06', '203.07', '203.08', '203.09', '203.10', '203.11', '203.12', '203.13', '203.14', '203.15', '203.16', '203.17', '203.18', '204', '204.01', '205', '205.01', '205.02', '205.03', '205.04', '205.05', '205.06', '206', '206.01', '206.02', '206.03', '206.04', '206.05', '207', '207.01', '207.02', '208', '208.01', '208.02', '209', '209.01', '209.02', '210', '210.01', '210.02', '210.03', '210.04', '210.05', '210.06', '210.07', '211', '211.01', '211.02', '211.03', '212', '212.01', '213', '213.01', '213.02', '213.03', '213.04', '213.05', '213.06', '213.07', '214', '214.01', '215', '215.01', '215.02', '215.03', '216', '216.01', '216.02', '216.03', '216.04', '216.05', '216.06', '216.07', '216.08', '216.09', '216.10', '216.11', '216.12', '217', '217.01', '218', '218.01', '200.02', '251', '251.01', '251.02', '251.03', '251.04', '251.05', '251.06', '252', '252.01', '252.02', '252.03', '252.04', '252.05', '252.06', '252.07', '252.08', '252.09', '252.10', '252.11', '252.12', '252.13', '252.14', '252.15', '252.16', '252.17', '253', '253.01', '253.02', '253.03', '253.04', '253.05', '253.06', '253.07', '253.08', '253.09', '253.10', '253.11', '253.12', '253.13', '253.14', '253.15', '253.16', '253.17', '253.18', '254', '254.01', '255', '255.01', '256', '256.01', '257', '257.01', '258', '258.01', '259', '259.01', '259.02', '259.03', '260', '260.01', '300', '301', '301.01', '301.02', '301.03', '301.04', '301.05', '302', '302.01', '302.02', '302.03', '303', '303.01', '304', '304.01', '304.02', '304.03', '304.04', '305', '305.01', '305.02', '305.03', '306', '306.01', '400', '401', '401.01', '401.02', '401.03', '401.04', '401.05', '401.06', '401.07', '401.08', '401.09', '401.10', '401.11', '401.12', '401.13', '401.14', '401.15', '401.16', '401.17', '401.18', '401.19', '401.20', '401.21', '401.22', '401.23', '401.24', '401.25', '401.26', '401.27', '401.28', '401.29', '401.30', '401.31', '401.32', '401.33', '401.34', '401.35', '401.36', '401.37', '401.38', '402', '402.01', '402.02', '402.03', '402.04', '403', '403.01', '403.02', '403.03', '403.04', '403.05', '500', '501', '501.01', '501.02', '501.03', '501.04', '501.05', '501.06', '501.07', '501.08', '502', '502.01', '502.02', '502.03', '502.04', '503', '503.01', '504', '504.01', '504.02', '504.03', '504.04', '504.05', '504.06', '504.07', '504.08', '504.09', '504.10', '504.11', '504.12', '504.13', '504.14', '504.15', '504.16', '504.17', '504.18', '504.19', '504.20', '504.21', '504.22', '504.23', '504.24', '504.25', '505', '505.01', '505.02', '600', '601', '601.01', '601.02', '601.03', '601.04', '601.05', '601.06', '601.07', '601.08', '601.09', '601.10', '601.11', '601.12', '601.13', '601.14', '601.15', '601.16', '601.17', '601.18', '601.19', '601.20', '601.21', '601.22', '601.23', '601.24', '601.25', '601.26', '601.27', '601.28', '601.29', '601.30', '601.31', '601.32', '601.33', '601.34', '601.35', '601.36', '601.37', '601.38', '601.39', '601.40', '601.41', '601.42', '601.43', '601.44', '601.45', '601.46', '601.47', '601.48', '601.49', '601.50', '601.51', '601.52', '601.53', '601.54', '601.55', '601.56', '601.57', '601.58', '601.59', '601.60', '601.61', '601.62', '601.63', '601.64', '601.65', '601.66', '601.67', '601.68', '601.69', '601.70', '601.71', '601.72', '601.73', '601.74', '601.75', '601.76', '601.77', '601.78', '601.79', '601.80', '601.81', '601.82', '601.83', '601.84', '602', '602.01', '602.02', '602.03', '602.04', '602.05', '602.06', '602.07', '602.08', '602.09', '602.10', '602.11', '602.12', '602.13', '602.14', '602.15', '602.16', '602.17', '602.18', '602.19', '602.20', '602.21', '602.22', '602.23', '602.24', '602.25', '602.26', '602.27', '602.28', '602.29', '602.30', '602.31', '602.32', '602.33', '602.34', '602.35', '602.36', '602.37', '602.38', '602.39', '602.40', '602.41', '602.42', '602.43', '602.44', '602.45', '602.46', '602.47', '602.48', '602.49', '602.50', '602.51', '602.52', '602.53', '602.54', '602.55', '602.56', '602.57', '602.58', '602.59', '602.60', '602.61', '602.62', '602.63', '602.64', '602.65', '602.66', '602.67', '602.68', '602.69', '602.70', '602.71', '602.72', '602.73', '602.74', '602.75', '602.76', '602.77', '602.78', '602.79', '602.80', '602.81', '602.82', '602.83', '602.84', '603', '603.01', '603.02', '603.03', '603.04', '603.05', '603.06', '603.07', '603.08', '603.09', '603.10', '603.11', '603.12', '603.13', '603.14', '603.15', '603.16', '603.17', '603.18', '603.19', '603.20', '603.21', '603.22', '603.23', '603.24', '603.25', '603.26', '603.27', '603.28', '603.29', '603.30', '603.31', '603.32', '603.33', '603.34', '603.35', '603.36', '603.37', '603.38', '603.39', '603.40', '603.41', '603.42', '603.43', '603.44', '603.45', '603.46', '603.47', '603.48', '603.49', '603.50', '603.51', '603.52', '603.53', '603.54', '603.55', '603.56', '603.57', '603.58', '603.59', '603.60', '603.61', '603.62', '603.63', '603.64', '603.65', '603.66', '603.67', '603.68', '603.69', '603.70', '603.71', '603.72', '603.73', '603.74', '603.75', '603.76', '603.77', '603.78', '603.79', '603.80', '603.81', '603.82', '604', '604.01', '604.02', '604.03', '604.04', '604.05', '604.06', '604.07', '604.08', '604.09', '604.10', '604.11', '604.12', '604.13', '604.14', '604.15', '604.16', '604.17', '604.18', '604.19', '604.20', '604.21', '604.22', '604.23', '604.24', '604.25', '604.26', '604.27', '604.28', '604.29', '604.30', '604.31', '604.32', '604.33', '604.34', '604.35', '604.36', '604.37', '604.38', '604.39', '604.40', '604.41', '604.42', '604.43', '604.44', '604.45', '604.46', '604.47', '604.48', '604.49', '604.50', '604.51', '604.52', '604.53', '604.54', '604.55', '604.56', '604.57', '604.58', '604.59', '604.60', '604.61', '604.62', '604.63', '604.64', '604.65', '604.66', '604.67', '604.68', '604.69', '604.70', '604.71', '604.72', '604.73', '604.74', '604.75', '604.76', '604.77', '604.78', '604.79', '604.80', '604.81', '604.82', '605', '605.01', '605.02', '605.03', '605.04', '605.05', '605.06', '605.07', '605.08', '605.09', '605.10', '605.11', '605.12', '605.13', '605.14', '605.15', '605.16', '605.17', '605.18', '605.19', '605.20', '605.21', '605.22', '605.23', '605.24', '605.25', '605.26', '605.27', '605.28', '605.29', '605.30', '605.31', '606', '606.01', '607', '607.01', '608', '608.01', '609', '609.01', '610', '610.01', '611', '611.01', '611.02', '612', '612.01', '613', '613.01', '613.02', '613.03', '613.04', '613.05', '613.06', '613.07', '613.08', '613.09', '613.10', '613.11', '613.12', '613.13', '613.14', '613.15', '613.16', '613.17', '613.18', '614', '614.01', '614.02', '614.03', '614.04', '614.05', '614.06', '614.07', '614.08', '614.09', '614.10', '700', '701', '701.01', '701.02', '701.03', '701.04', '701.05', '701.06', '701.07', '701.08', '701.09', '701.10', '701.11', '702', '702.01', '702.02', '702.03', '702.04', '702.05', '702.06', '702.07', '702.08', '702.09', '702.10', '703', '703.01', '703.02', '703.03', '703.04', '703.05', '703.06', '703.07', '703.08', '703.09', '703.10', '703.11', '703.12', '703.13', '703.14', '703.15', '703.16', '703.17', '703.18', '703.19', '703.20', '703.21', '704', '704.01', '704.02', '704.03', '704.04', '704.05', '704.06', '704.07', '704.08', '704.09', '704.10', '704.11', '704.12', '704.13', '704.14', '704.15', '704.16', '704.17', '704.18', '704.19', '704.20', '704.21', '704.22', '704.23', '800', '801', '801.01', '801.02', '802', '802.01', '802.02', '803', '803.01', '803.02', '804', '804.01', '804.02', '805', '805.01', '805.02', '806', '806.01', '806.02', '807', '807.01', '807.02', '808', '808.01', '808.02', '809', '809.01', '809.02', '810', '810.01', '810.02', '811', '811.01', '811.02', '812', '812.01', '812.02', '813', '813.01', '813.02', '814', '814.01', '814.02', '815', '815.01', '815.02', '816', '816.01', '816.02', '899', '899.01', '899.02'}.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'CodAgrup': 'XXX' is not a valid value of the atomic type '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogosParaEsqContE}c_CodAgrup'."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7910 - Validar valores con logitud mayor a 100 para el campo Numero de Cuenta para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7910.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'NumCta': [facet 'maxLength'] The value '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901' has a length of '101'; this exceeds the allowed maximum length of '100'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'NumCta': '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7911 - Validar valores con longitud mayor a 400 para el campo Descripción para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7911.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'Desc': [facet 'maxLength'] The value '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901' has a length of '401'; this exceeds the allowed maximum length of '400'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'Desc': '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7912 - Validar valores con longitud mayor a 100 para el campo Clave de la Subcuenta del Archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7912.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'SubCtaDe': [facet 'maxLength'] The value '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901' has a length of '101'; this exceeds the allowed maximum length of '100'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'SubCtaDe': '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7913 - Validar valores con longitud mayor a 1 para el campo Nivel del Archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7913.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'SubCtaDe': [facet 'maxLength'] The value '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901' has a length of '101'; this exceeds the allowed maximum length of '100'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'SubCtaDe': '12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7914 - Validar letras en el campo Nivel del Archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7914.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'Nivel': 'A' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7915 - Validar caracteres diferentes a A/D para el campo Naturaleza del Archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7915.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'Natur': [facet 'pattern'] The value 'B' is not accepted by the pattern '[DA]'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Ctas', attribute 'Natur': 'B' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7916 - Validar RFC con logitud menor a 12 caracteres para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7916.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'RFC': [facet 'minLength'] The value 'AAA010101AA' has a length of '11'; this underruns the allowed minimum length of '12'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'RFC': 'AAA010101AA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7917 - Validar RFC con longitud mayor a 13 caracteres para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7917.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'RFC': [facet 'maxLength'] The value 'AAA010101AAAAA' has a length of '14'; this exceeds the allowed maximum length of '13'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'RFC': [facet 'pattern'] The value 'AAA010101AAAAA' is not accepted by the pattern '[A-ZÑ&]{3,4}[0-9]{2}[0-1][0-9][0-3][0-9][A-Z0-9]?[A-Z0-9]?[0-9A-Z]?'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'RFC': 'AAA010101AAAAA' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end

describe "C7919 - Validar Numero de certificado mayor a 20 caracteres para el archivo de Cuentas" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_contabilidad/resources/catalogo/catalogo_C7919.xml")
    uri      = URI(@base_url + @conta_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_catalogo)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "schema_validation"
    assert response[:request_headers].should include({:"content-type"=>"application/vnd.sat.catalogocuentas+xml"}, {:"x-master-key"=>"E4WPPefDRywwmIjhSGPthQ=="}, {:"x-client-id"=>"1"}, {:"x-client-rfc"=>"AAA010101AAA"}, {:"x-auth-token"=>"12312"}, {:"x-profile-id"=>"1"}, {:"x-user-id"=>"1"}, {:"x-channel"=>"web_service"})
    assert response[:message].should == "El documento no cumple con el esquema definido por el SAT"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details][:message].should == "Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'noCertificado': [facet 'length'] The value '200010000002000014281' has a length of '21'; this differs from the allowed length of '20'.Element '{www.sat.gob.mx/esquemas/ContabilidadE/1_1/CatalogoCuentas}Catalogo', attribute 'noCertificado': '200010000002000014281' is not a valid value of the local atomic type."
    assert response[:error_details][:field].should == nil
    assert response[:error_details][:code].should == 1450
    assert response[:code].should == 4401
  end

end