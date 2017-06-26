# encoding: utf-8

require "wsspec_helper"

describe "C13448 - Validar que al realizar el envío de un xml de remisión al servicio de emisión, se obtenga el CFDI regrese un HTTP 201" do

    include_context "config"
    include_context "request_headers"

    it Time.now do
        document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C11238.xml")
        uri      = URI(@base_url + @dpiva_url)
        req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
        req.body = document
        res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }
    end
end

=begin

describe "C11238 - DPIVA - Validar  Validar que el documento digital deberá estar referenciado al namespace de acuerdo a lo especificado" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C11238.xml")
    uri      = URI(@base_url + @dpiva_url)
    req      = Net::HTTP::Post.new(uri.path, @headers_dpiva)
    req.body = document
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 200

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:user_stamp].should =~ //
    assert response[:transaction_id].should =~ //
    assert response[:sat_stamp].should =~ //
    assert response[:transaction_id].should =~ //
    assert response[:pac_chain].should =~ //
    assert response[:folio].should =~ //
    assert response[:document].should =~ //
    assert response[:chain].should =~ //
    assert response[:acuse].should =~ //
  end

end



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
=end