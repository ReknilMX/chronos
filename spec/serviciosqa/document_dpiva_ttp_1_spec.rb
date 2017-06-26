# encoding: utf-8

require "wsspec_helper"

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

describe "C11240 - DPIVA - Validar que la versión para el documento sea 1.0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C11240.xml")
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

describe "C11241 - DPIVA - Validar que cuando el atributo Ejercicio permita valores 2015" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C11241.xml")
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

describe "C10674 - DPIVA - Validar que cuando el atributo TipoPerid tenga valores que esten dentro del cat: c_peridicidad - test 4" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10674_test_4.xml")
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

describe "C10674 - DPIVA - Validar que cuando el atributo TipoPerid tenga valores que esten dentro del cat: c_peridicidad - test 5" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10674_test_5.xml")
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

describe "C10674 - DPIVA - Validar que cuando el atributo TipoPerid tenga valores que esten dentro del cat: c_peridicidad - test 6" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10674_test_6.xml")
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

describe "C10674 - DPIVA - Validar que cuando el atributo TipoPerid tenga valores que esten dentro del cat: c_peridicidad - test 7" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10674_test_7.xml")
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

describe "C11242 - DPIVA - Validar cuando el atributo DPIVA = 0 no se ingrese infomación en los Nodos ProvNacional, ProvExtranjero, ProvGlobal" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C11242.xml")
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

describe "C10678 - DPIVA - Validar cuando el atributo DPIVA = 1 ingresar al menos 1 nodo  ProvNacional, ProvExtranjero, ProvGlobal y montos mayores a 0 de los elementos que integren el nodo" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10678.xml")
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

describe "C11244 - DPIVA - Validar cuando el atributo DPIVA = 1 ingresar al menos 1 nodo  ProvNacional, ProvExtranjero, ProvGlobal" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C11244.xml")
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

describe "C10681 - DPIVA - Validar el atributo TipoDec = 1 Normal" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10681.xml")
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

describe "C10682 - DPIVA - Validar el atributo TipoDec = 2 Complementaria" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10682.xml")
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

describe "C10683 - DPIVA - Validar que el atributo Folio Ant sea opcional si el TipoDec = 1 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10683_test_1.xml")
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

describe "C10683 - DPIVA - Validar que el atributo Folio Ant sea opcional si el TipoDec = 1 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10683_test_2.xml")
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

describe "C10686 - DPIVA - Validar que el atributo Folio Ant sea obligatoria si el TipoDec = 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10686.xml")
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

describe "C10687 - DPIVA - Validar que el atributo FechaPresAnt sea opcional si el TipoDec = 1 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10687_test_1.xml")
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

describe "C10687 - DPIVA - Validar que el atributo FechaPresAnt sea opcional si el TipoDec = 1 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10687_test_2.xml")
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

describe "C11245 - DPIVA - Validar que el atributo FechaPresAnt sea requerida si el TipoDec = 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C11245.xml")
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

describe "C10695 - DPIVA - Totales - Validar que el atributo TotActPAgTas15o16IVA tenga valor 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10695.xml")
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

describe "C10697 - DPIVA - Totales - Validar que el atributoTotActPAgTas15IVA tenga un valor 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10697.xml")
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

describe "C10699 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrTas15o16 tenga valor 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10699.xml")
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

describe "C10703 - DPIVA - Totales - Validar que el atributo TotActPagTas11o10IVA tenga 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10703.xml")
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

describe "C10707 - DPIVA - Totales - Validar que el atributo TotActPagTas10IVA aplique solo cuando Ejercicio = 2010 y Periodicidad = Enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10707.xml")
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

describe "C10708 - DPIVA - Totales - Validar que el atributo TotActPagTas10IVA tenga 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10708.xml")
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

describe "C10711 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrTas10u11 tenga 0 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10711_test_1.xml")
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

describe "C10711 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrTas10u11 tenga 0 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10711_test_2.xml")
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

describe "C10712 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrTas10u11 aplique  cuando Ejercicio <= 2013" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10712.xml")
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

describe "C10713 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrTas10u11 aplique  cuando Ejercicio = 2014, Periodicidad = Mensual , periodo = Enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10713.xml")
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

describe "C10720 - DPIVA - Totales - Validar que el atributo TotActPagImpBySTas15o16IVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10720.xml")
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

describe "C10724 - DPIVA - Totales - Validar que el atributo TotActPagImpBySTas10o11IVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10724.xml")
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

describe "C10725 - DPIVA - Totales - Validar que el atributo TotActPagImpBySTas10o11IVA aplique cuando Ejercicio = 2013" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10725.xml")
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

describe "C10726 - DPIVA - Totales - Validar que el atributo TotActPagImpBySTas10o11IVA aplique cuando Ejercicio =2014, Periodicidad = Mensual , periodo = Enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10726.xml")
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

describe "C10729 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrImpTas10u11 permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10729.xml")
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

describe "C10730 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrImpTas10u11 aplique cuando Ejercicio <= 2013 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10730_test_1.xml")
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

describe "C10730 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrImpTas10u11 aplique cuando Ejercicio <= 2013 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10730_test_2.xml")
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

describe "C10731 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrImpTas10u11 aplique cuando Ejercicio = 2014, Periodicidad = Mensual , periodo = Enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10731.xml")
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

describe "C10741 - DPIVA - Totales - Validar que el atributo TotActPagImpBySNoPagIVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10741.xml")
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

describe "C10744 - DPIVA - Totales - Validar que el atributo TotDemActPagTas0IVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10744.xml")
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

describe "C10747 - DPIVA - Totales - Validar que el atributo TotActPagNoPagIVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10747.xml")
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

describe "C10750 - DPIVA - Totales - Validar que el atributo TotIVARetCont permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10750.xml")
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

describe "C10753 - DPIVA - Totales - Validar que el atributo TotIVADevDescyBonifComp permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10753.xml")
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

describe "C10756 - DPIVA - Totales - Validar que el atributo TotIVATraslContExcImpByS permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10756.xml")
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

describe "C10762 - DPIVA- Totales - Validar que el atributo TotIVAPagImpByS permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10762.xml")
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

describe "C10775 - DPIVA - ProvNacional - Validar que el atributo TipoOperac permita el valor 03, 06 y 85 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10775_test_1.xml")
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

describe "C10775 - DPIVA - ProvNacional - Validar que el atributo TipoOperac permita el valor 03, 06 y 85 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10775_test_2.xml")
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

describe "C10780 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas15o16IVA sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10780.xml")
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

describe "C10781 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas15o16IVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10781.xml")
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

describe "C10783 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas15IVA sea opcional" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10783.xml")
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

describe "C10784 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas15IVA aplique cuando Ejercicio = 2010, Periodicidad = mensual, Periodo = Enero" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10784.xml")
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

describe "C10785 - DPIVA - ProvNacional - Validar que el atributo ValActPagTas15IVA permita 0" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10785.xml")
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