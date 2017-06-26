# encoding: utf-8

require "wsspec_helper"

describe "C11478 - Aprovisiona un Perfil a un Cliente con un id inválido" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    uri      = URI(@sso_url + "/api/v1/clients/a/profiles/1")
    req      = Net::HTTP::Post.new(uri.path, @headers_sso)
    req.body = '{"is_prepaid": false}'
    res = Net::HTTP.new(uri.host, uri.port).start { |http| http.request(req) }

    code = res.code.to_i
    assert code.should == 400

    response = JSON.parse(res.body, {:symbolize_names=>true})
    assert response[:stage].should == "data_validation"
    assert response[:request_headers].should == {:content_type=>"application/json"}
    assert response[:message].should == "Dato(s) no valido(s)"
    assert response[:level].should == 5
    assert response[:error_id].should be > 0
    assert response[:error_details].should == {"client_id":"is invalid"}
    assert response[:code].should == 1401
  end

end
