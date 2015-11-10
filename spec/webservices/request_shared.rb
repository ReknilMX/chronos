# encoding: utf-8

RSpec.shared_context "request_headers", :a => :b do
  before(:each) do
  	@base_url = "http://localhost:4010"
  	@conta_url = "/api/v1/documentos/emitir"
  	@dpiva_url = "/api/v1/documentos/recibir"
  	@headers_dpiva = {'content-type' =>'application/vnd.sat.dpiva+xml',
	'x-master-key' => '4ZU51gLxQKuvVf0u6F0Kmg==',
	'x-client-id' => '1',
	'x-client-rfc' => 'AAA010101AAA',
	'x-auth-token' => '12312',
	'x-profile-id' => '1',
	'x-user-id' => '1',
	'x-channel' => 'web_service'}
	@headers_poliza = {'content-type' =>'application/vnd.sat.polizas+xml',
	'x-master-key' => 'E4WPPefDRywwmIjhSGPthQ==',
	'x-client-id' => '1',
	'x-client-rfc' => 'AAA010101AAA',
	'x-auth-token' => '12312',
	'x-profile-id' => '1',
	'x-user-id' => '1',
	'x-channel' => 'web_service'}
	@headers_balanza = {'content-type' =>'application/vnd.sat.balanzacontable+xml',
	'x-master-key' => 'E4WPPefDRywwmIjhSGPthQ==',
	'x-client-id' => '1',
	'x-client-rfc' => 'AAA010101AAA',
	'x-auth-token' => '12312',
	'x-profile-id' => '1',
	'x-user-id' => '1',
	'x-channel' => 'web_service'}
	@headers_catalogo = {'content-type' =>'application/vnd.sat.catalogocuentas+xml',
	'x-master-key' => 'E4WPPefDRywwmIjhSGPthQ==',
	'x-client-id' => '1',
	'x-client-rfc' => 'AAA010101AAA',
	'x-auth-token' => '12312',
	'x-profile-id' => '1',
	'x-user-id' => '1',
	'x-channel' => 'web_service'}
  end
end
