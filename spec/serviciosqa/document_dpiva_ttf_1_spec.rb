# encoding: utf-8

require "servicosqaspec_helper"

describe "C11239 - DPIVA - Validar que si el documento digital no esta referenciado al namespace de acuerdo a lo especificado muestre un mensaje de error" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/serviciosqa/resources/CFDI33_Pagos10_QA.xml")
    content = Base64.strict_encode64(document)

    uri      = URI(@base_url + @emision) #URL de emision
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path, @headers) #Headers de emision
    request.body = "{\"credentials\": {\"id\": \"#{id}\",\"token\": \"#{token}\"},
                        \"issuer\": {\"rfc\": \"#{rfc}\"},
                        \"receiver\": {\"emails\": [{\"email\": \"#{email}\",\"format\": \"xml+pdf\",\"template\": \"letter\"}]},
                    \"document\": {
                    \"certificate-number\": \"#{certnumb}\",\"section\": \"all\",\"format\": \"xml\",\"template\": \"letter\",
                    \"type\": \"#{type}\",
                    \"content\": \"#{content}\"}}" #Contenido
    response = http.request(request)
    #response = Net::HTTP.get_response(uri)
    #response = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(request) }

    code = response.code.to_i
    assert code.should == 400

    puts response = JSON.parse(response.body, {:symbolize_names=>true})
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
