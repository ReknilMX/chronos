# encoding: utf-8

require "wsspec_helper"

describe "C10787 - DPIVA - ProvNacional - Validar que el atributo MonIvaPagNoAcrTas15o16 sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10787.xml")
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

describe "C10798 - DPIVA - ProvNacional - Validar que el atributo MonIvaPagNoAcrTas15o16 permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10798.xml")
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

describe "C10800 - DPIVA - ProvNacional - Validar que cuando el atributo ValActPagTas10u11IVA sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10800.xml")
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

describe "C10801 - DPIVA - ProvNacional - Validar que cuando el atributo ValActPagTas10u11IVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10801.xml")
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

describe "C10802 - DPIVA - ProvNacional - Validar que cuando el atributo ValActPagTas10u11IVA aplique cuando el ejercicio <= 2013 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10802_test_1.xml")
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

describe "C10802 - DPIVA - ProvNacional - Validar que cuando el atributo ValActPagTas10u11IVA aplique cuando el ejercicio <= 2013 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10802_test_2.xml")
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

describe "C10803 - DPIVA - ProvNacional - Validar que cuando el atributo ValActPagTas10u11IVA aplique cuando el ejercicio = 2014, periodicidad mensual, periodo = enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10803.xml")
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

describe "C10805 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas10IVA  sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10805.xml")
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

describe "C10806 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas10IVA  permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10806.xml")
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

describe "C10807 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas10IVA aplique cuando el ejercicio = 2010, Periodicidad= mensual , Periodo = Enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10807.xml")
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

describe "C10809 - DPIVA - ProvNacional - Validar que el atributo MonIVAPAgNoAcrTas10u11 sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10809.xml")
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

describe "C10810 - DPIVA - ProvNacional - Validar que el atributo MonIVAPAgNoAcrTas10u11 sea permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10810.xml")
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

describe "C10811 - DPIVA - ProvNacional - Validar que el atributo MonIVAPAgNoAcrTas10u11 sea opcional aplique cuando el ejercicio <=2013 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10811_test_1.xml")
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

describe "C10811 - DPIVA - ProvNacional - Validar que el atributo MonIVAPAgNoAcrTas10u11 sea opcional aplique cuando el ejercicio <=2013 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10811_test_2.xml")
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

describe "C10812 - DPIVA - ProvNacional - Validar que el atributo MonIVAPAgNoAcrTas10u11 sea opcional aplique cuando el ejercicio =2014 , periodicidad mensual, periodo = enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10812.xml")
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

describe "C10814 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas0IVA sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10814.xml")
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

describe "C10815 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas0IVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10815.xml")
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

describe "C10817 - DPIVA - ProvNacional - Validar que el atributo ValActPagNoIVA sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10817.xml")
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

describe "C10818 - DPIVA - ProvNacional - Validar que el atributo ValActPagNoIVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10818.xml")
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

describe "C10820 - DPIVA - ProvNacional - Validar que el atributo IVARetCont sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10820.xml")
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

describe "C10821 - DPIVA - ProvNacional - Validar que el atributo IVARetCont permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10821.xml")
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

describe "C10823 - DPIVA - ProvNacional - Validar que el atributo IVADevDescyBonifComp sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10823.xml")
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

describe "C10824 - DPIVA - ProvNacional - Validar que el atributo IVADevDescyBonifComp permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10824.xml")
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

describe "C10826 - DPIVA - ProvExtranjero - Validar que el nodo sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10826.xml")
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

describe "C10828 - DPIVA - ProvExtranjero - Validar que el atributo TipoOperac permita el valor 03, 06 y 85 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10828_test_1.xml")
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

describe "C10828 - DPIVA - ProvExtranjero - Validar que el atributo TipoOperac permita el valor 03, 06 y 85 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10828_test_2.xml")
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

describe "C10833 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas15o16IVA sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10833.xml")
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

describe "C10834 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas15o16IVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10834.xml")
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

describe "C10836 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas15IVA sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10836.xml")
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

describe "C10837 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas15IVA aplique cuando Ejercicio = 2010, Periodicidad = mensual, Periodo = Enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10837.xml")
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

describe "C10838 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas15IVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10838.xml")
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

describe "C10840 - DPIVA - ProvExtranjero - Validar que el atributo MonIvaPagNoAcrTas15o16 sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10840.xml")
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

describe "C10841 - DPIVA - ProvExtranjero - Validar que el atributo MonIvaPagNoAcrTas15o16 permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10841.xml")
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

describe "C10843 - DPIVA - ProvExtranjero - Validar que cuando el atributo ValActPagTas10u11IVA sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10843.xml")
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

describe "C10844 - DPIVA - ProvExtranjero - Validar que cuando el atributo ValActPagTas10u11IVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10844.xml")
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

describe "C10845 - DPIVA - ProvExtranjero - Validar que cuando el atributo ValActPagTas10u11IVA aplique cuando el ejercicio <= 2013 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10845_test_1.xml")
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

describe "C10845 - DPIVA - ProvExtranjero - Validar que cuando el atributo ValActPagTas10u11IVA aplique cuando el ejercicio <= 2013 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10845_test_2.xml")
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

describe "C10846 - DPIVA - ProvExtranjero - Validar que cuando el atributo ValActPagTas10u11IVA aplique cuando el ejercicio = 2014, periodicidad mensual, periodo = enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10846.xml")
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

describe "C10848 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas10IVA  sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10848.xml")
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

describe "C10849 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas10IVA  permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10849.xml")
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

describe "C10850 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas10IVA aplique cuando el ejercicio = 2010, Periodicidad= mensual , Periodo = Enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10850.xml")
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

describe "C10852 - DPIVA - ProvExtranjero - Validar que el atributo MonIVAPAgNoAcrTas10u11 sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10852.xml")
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

describe "C10853 - DPIVA - ProvExtranjero - Validar que el atributo MonIVAPAgNoAcrTas10u11 sea permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10853.xml")
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

describe "C10854 - DPIVA - ProvExtranjero - Validar que el atributo MonIVAPAgNoAcrTas10u11 sea opcional aplique cuando el ejercicio <=2013 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10854_test_1.xml")
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

describe "C10854 - DPIVA - ProvExtranjero - Validar que el atributo MonIVAPAgNoAcrTas10u11 sea opcional aplique cuando el ejercicio <=2013 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10854_test_2.xml")
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

describe "C10855 - DPIVA - ProvExtranjero - Validar que el atributo MonIVAPAgNoAcrTas10u11 sea opcional aplique cuando el ejercicio =2014 , periodicidad mensual, periodo = enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10855.xml")
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

describe "C10857 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas0IVA sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10857.xml")
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

describe "C10858 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagTas0IVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10858.xml")
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

describe "C10860 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagNoIVA sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10860.xml")
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

describe "C10861 - DPIVA - ProvExtranjero - Validar que el atributo ValActPagNoIVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10861.xml")
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