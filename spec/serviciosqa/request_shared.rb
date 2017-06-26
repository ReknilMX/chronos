# encoding: utf-8

RSpec.shared_context "request_headers", :a => :b do
  before(:each) do
  	@base_url = SERVAPP_CONFIG['base_url']
  	@emision = "/api/v1/documents/issue"
  	@timbrado = "/api/v1/documents/stamp"
  	@headers = {"content-type" => "application/json", "charset" => "utf-8"}
  	@clientid1 = SERVAPP_CONFIG['clientid1']
  	@clientrfc1 = SERVAPP_CONFIG['clientrfc1']
  	@clientcert1 = SERVAPP_CONFIG['clientcert1']
  	@clienttoken1 = SERVAPP_CONFIG['clienttoken1']
    @clientemail1 = SERVAPP_CONFIG['clientemail1']
  	@typecfdi33 = "application/vnd.diverza.cfdi_3.3+xml"
  	@typecfdi33complementos = "application/vnd.diverza.cfdi_3.3_complemento+xml"
  	@typecfdi33nomina = "application/vnd.diverza.cfdi_3.3_complemento_nomina+xml"
  end
end
