# encoding: utf-8

require "wsspec_helper"

describe "C10938 - DPIVA - Validar que para los atributos TipoPerid y Periodo haya correspondencia de acuerdo a los catalogos del SAT - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10938_test_2.xml")
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

describe "C10938 - DPIVA - Validar que para los atributos TipoPerid y Periodo haya correspondencia de acuerdo a los catalogos del SAT - test 3" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10938_test_3.xml")
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

describe "C10938 - DPIVA - Validar que para los atributos TipoPerid y Periodo haya correspondencia de acuerdo a los catalogos del SAT - test 4" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10938_test_4.xml")
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

describe "C10941 - DPIVA - Totales - Validar que el atributo TotOperac debe coincidir con la suma de operaciones declaradas en los nodos ProvNacional, ProvExtranjero y ProvGlobal" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10941.xml")
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

describe "C10943 - DPIVA - Totales - Validar que el atributo TotActPagTas15o16 IVA es la  de los actos o actividades pagados a la tasa del 15 o 16 % de IVA reportados en los diferentes nodos." do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10943.xml")
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

describe "C10945 - DPIVA - Totales - Validar que el atributo TotActPagTas15IVA es la sumatoria de los actos o actividades pagados a la tasa del 15% para los diferentes nodos." do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10945.xml")
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

describe "C10947 - DPIVA - Totales -  Validar que el atributo TotIVAPagNoAcrTas 15 o 16 es la sumatoria del IVA pagado no acreditable a la tasa del 15 % reportado para los diferentes nodos." do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10947.xml")
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

describe "C10949 - DPIVA - Totales - Validar que el atributo TotActPagTAs10u11IVA es la sumatoria pa de los  actos y actividades pagados a la tasa del 10 u 11 % de IVA reportados en los nodos." do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10949.xml")
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

describe "C10951 - DPIVA - Totales - Validar que el atributo TotActPagTas10IVA es la sumatoria de los actos y actividades pagadas al 10 % de IVA para los diferentes nodos." do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10951.xml")
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

describe "C10953 - DPIVA - Totales - Validar que el atributo TotIVAPagNoAcrTAs10u11 es la sumatoria del Monto de IVA no acreditable a la tasa del 10 u 11 % reportadas para los diferentes nodos." do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10953.xml")
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

describe "C10955 - DPIVA - Totales - Validar que el atributo TotActPAgImpBySTas15o16IVA es sumatoria de los actos o actividades pagados  a la tasa del 15 o 16 %  para los diferentes nodos en la importación de bienes y servicios." do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10955.xml")
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

describe "C10957 - DPIVA - Totales - Validar que el atributo TotActPAgNoAcrImpTas15o16 es la sumatoria de  los montos de IVA pagado no acreditable por la importación a la tasa del 15 o 16 % reportados para los diferentes nodos" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10957.xml")
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

describe "C10959 - DPIVA -Totales - Validar que el atributo TotActPagImpBySTas10u11IVA es la sumatoria de los actos o actividades pagados en la importación de bienes y servicios pagados a la tasa del 10 o 11 de IVA reportados para los diferentes nodos" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10959.xml")
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

describe "C10961 -  DPIVA - Totales - Validar que el atributo TotActPagImpBySNoPagaIVA es la sumatoria de los actos y actividades pagados en la importación de bienes y servicios por lo que no se paga IVA, reportados para los diferentes nodos" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10961.xml")
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

describe "C10963 -  DPIVA - Totales - Validar que el atributo TotDemActPagTas0IVA sea la sumatoria de los actos o actividades pagados a la tasa del 0% de IVA , reportados para los diferentes nodos" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10963.xml")
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

describe "C10965 - DPIVA - Totales - Validar que el atributo TotActNoPagIVA sea la sumatoria de los actos o actividades exentos de IVA para los diferentes proveedores" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10965.xml")
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

describe "C10967 - DPIVA - Totales - Validar que el atributo TotIVARetCont al no ser la sumatoria del IVA  retenido por el contribuyente  reportado para los diferentes nodos muestre mensaje de validación" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10967.xml")
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

describe "C10969 - DPIVA - Totales - Validar que el atributo TotIVADevDescyBonifComp sea la sumatoria de IVA correspondiente  a las devoluciones, descuentos  y bonificaciones sobre compras para los diferentes nodos" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10969.xml")
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

describe "C10971 - DPIVA - ProvNacional - Validar que el atributo RFCProv para el mes permita valores de 01 al 12 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10971_test_1.xml")
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

describe "C10971 - DPIVA - ProvNacional - Validar que el atributo RFCProv para el mes permita valores de 01 al 12 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10971_test_2.xml")
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

describe "C10973 - DPIVA - ProvNacional - Validar que el atributo RFCProv la correspondencia del mes con los díasdel 0 al 31 para los meses  01, 03, 05, 07, 08 , 10 y 12 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10973_test_1.xml")
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

describe "C10973 - DPIVA - ProvNacional - Validar que el atributo RFCProv la correspondencia del mes con los díasdel 0 al 31 para los meses  01, 03, 05, 07, 08 , 10 y 12 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10973_test_2.xml")
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

describe "C10974 - DPIVA - ProvNacional - Validar que el atributo RFCProv la correspondencia del mes con los días del 0 al 30 para los meses  04, 06, 09, 11 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10974_test_1.xml")
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

describe "C10974 - DPIVA - ProvNacional - Validar que el atributo RFCProv la correspondencia del mes con los días del 0 al 30 para los meses  04, 06, 09, 11 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10974_test_2.xml")
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

describe "C10975 - DPIVA - ProvNacional - Validar que el atributo RFCProv la correspondencia del mes con los días del 0 al 28 y 29 para el mes 2 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10975_test_1.xml")
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

describe "C10975 - DPIVA - ProvNacional - Validar que el atributo RFCProv la correspondencia del mes con los días del 0 al 28 y 29 para el mes 2 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10975_test_2.xml")
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

describe "C10977 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv para el mes permita valores de 01 al 12 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10977_test_1.xml")
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

describe "C10977 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv para el mes permita valores de 01 al 12 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10977_test_2.xml")
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

describe "C10979 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv la correspondencia del mes con los díasdel 0 al 31 para los meses  01, 03, 05, 07, 08 , 10 y 12 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10979_test_1.xml")
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

describe "C10979 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv la correspondencia del mes con los díasdel 0 al 31 para los meses  01, 03, 05, 07, 08 , 10 y 12 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10979_test_2.xml")
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

describe "C10980 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv la correspondencia del mes con los días del 0 al 30 para los meses  04, 06, 09, 11 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10980_test_1.xml")
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

describe "C10980 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv la correspondencia del mes con los días del 0 al 30 para los meses  04, 06, 09, 11 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10980_test_2.xml")
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

describe "C10981 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv la correspondencia del mes con los días del 0 al 28 y 29 para el mes 2 - test 1" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10981_test_1.xml")
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

describe "C10981 - DPIVA - ProvExtranjero - Validar que el atributo RFCProv la correspondencia del mes con los días del 0 al 28 y 29 para el mes 2 - test 2" do

  include_context "config"
  include_context "request_headers"

  it Time.now do
    document = File.read(Rails.root.join "spec/ws_dpiva/resources/dpiva_C10981_test_2.xml")
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