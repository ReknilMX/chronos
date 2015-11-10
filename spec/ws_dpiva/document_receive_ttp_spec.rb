# encoding: utf-8

require "wsspec_helper"

describe "C10541 - DD - Validar que el documento digital deberá estar referenciado al namespace de acuerdo a lo especificado en el standar de documentos digitales" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10541.xml")
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

describe "C11216 - DD - Validar que cuando el atributo Tipo Docto Digital permita valores  cat:c_tipodoctodigital - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C11216_test_1.xml")
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

describe "C11216 - DD - Validar que cuando el atributo Tipo Docto Digital permita valores  cat:c_tipodoctodigital - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C11216_test_2.xml")
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

describe "C11216 - DD - Validar que cuando el atributo Tipo Docto Digital permita valores  cat:c_tipodoctodigital - test 3" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C11216_test_3.xml")
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

describe "C11216 - DD - Validar que cuando el atributo Tipo Docto Digital permita valores  cat:c_tipodoctodigital - test 4" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C11216_test_4.xml")
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

describe "C10547 - DD - Validar que el atributo Cert muestre mensaje de error si esta vacío" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10547.xml")
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

describe "C10548 - DD - Validar que si se incluye el atributo Cert en formato base 64" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10548.xml")
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

describe "C10553 - DD - Validar que el atributo Firma  no sea un campo obligatorio (emisión)" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_C10553.xml")
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

describe "C11217 - DD EMI - Validar que permita ingresar   el atributo ERFC  con caracteres como Ñ y & - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C11217_test_1.xml")
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

describe "C11217 - DD EMI - Validar que permita ingresar   el atributo ERFC  con caracteres como Ñ y & - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C11217_test_2.xml")
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

describe "C10557 - DD EMI - Validar que el atributo ECURP sea opcional solo aplicable cuando es persona física" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dd_emi_C10557.xml")
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