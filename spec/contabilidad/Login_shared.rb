# encoding: utf-8

RSpec.shared_context "datos_vacios", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.button(:name => 'commit').click
  end
end

RSpec.shared_context "usuario_vacio", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_password').set "invalido"
    @driver.button(:name => 'commit').click
  end
end

RSpec.shared_context "password_vacio", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set "gutierrez"
    @driver.button(:name => 'commit').click
  end
end

RSpec.shared_context "usuario_invalido", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set "invalido"
    @driver.text_field(:id => 'session_password').set "invalido"
    @driver.button(:name => 'commit').click
  end
end

RSpec.shared_context "password_invalido", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set "gutierrez"
    @driver.text_field(:id => 'session_password').set "invalido"
    @driver.button(:name => 'commit').click
  end
end

RSpec.shared_context "login_cliente_CE", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set CONTAAPP_CONFIG['usernameCLICE']
    @driver.text_field(:id => 'session_password').set CONTAAPP_CONFIG['passwordCLICE']
    @driver.button(:name => 'commit').click
  end
end

RSpec.shared_context "login_contador_CE", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set CONTAAPP_CONFIG['usernameCONCE']
    @driver.text_field(:id => 'session_password').set CONTAAPP_CONFIG['passwordCONCE']
    @driver.button(:name => 'commit').click
  end
end

RSpec.shared_context "login_financiero_CE", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set CONTAAPP_CONFIG['usernameFINCE']
    @driver.text_field(:id => 'session_password').set CONTAAPP_CONFIG['passwordFINCE']
    @driver.button(:name => 'commit').click
  end
end

RSpec.shared_context "login_cliente_CEPR", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set CONTAAPP_CONFIG['usernameCLICEPR']
    @driver.text_field(:id => 'session_password').set CONTAAPP_CONFIG['passwordCLICEPR']
    @driver.button(:name => 'commit').click
  end
end

RSpec.shared_context "login_contador_CEPR", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set CONTAAPP_CONFIG['usernameCONCEPR']
    @driver.text_field(:id => 'session_password').set CONTAAPP_CONFIG['passwordCONCEPR']
    @driver.button(:name => 'commit').click
  end
end

RSpec.shared_context "login_financiero_CEPR", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set CONTAAPP_CONFIG['usernameFINCEPR']
    @driver.text_field(:id => 'session_password').set CONTAAPP_CONFIG['passwordFINCEPR']
    @driver.button(:name => 'commit').click
  end
end

RSpec.shared_context "login_dpiva_cliente_CEPR", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set CONTAAPP_CONFIG['usernameCLICEPR']
    @driver.text_field(:id => 'session_password').set CONTAAPP_CONFIG['passwordCLICEPR']
    @driver.button(:name => 'commit').click
    @driver.link(:text => 'DPIVA').click
    @driver.file_field(:id => 'fiel_fiel_key_file').set(Rails.root.join "spec/dpiva/resources/AAA010101AAA_FIEL.key")
    @driver.text_field(:id => 'fiel_fiel_private_key').set "12345678a"
    @driver.link(:id => 'fiel-login-button').click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
  end
end

RSpec.shared_context "login_dpiva_contador_CEPR", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set CONTAAPP_CONFIG['usernameCONCEPR']
    @driver.text_field(:id => 'session_password').set CONTAAPP_CONFIG['passwordCONCEPR']
    @driver.button(:name => 'commit').click
    @driver.link(:text => 'DPIVA').click
    @driver.file_field(:id => 'fiel_fiel_key_file').set(Rails.root.join "spec/dpiva/resources/AAA010101AAA_FIEL.key")
    @driver.text_field(:id => 'fiel_fiel_private_key').set "12345678a"
    @driver.link(:id => 'fiel-login-button').click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
  end
end

RSpec.shared_context "login_dpiva_financiero_CEPR", :a => :b do
  before(:each) do
    @base_url = CONTAAPP_CONFIG['base_url']
    @driver.goto @base_url
    @driver.text_field(:id => 'session_username').set CONTAAPP_CONFIG['usernameFINCEPR']
    @driver.text_field(:id => 'session_password').set CONTAAPP_CONFIG['passwordFINCEPR']
    @driver.button(:name => 'commit').click
    @driver.link(:text => 'DPIVA').click
    @driver.file_field(:id => 'fiel_fiel_key_file').set(Rails.root.join "spec/dpiva/resources/AAA010101AAA_FIEL.key")
    @driver.text_field(:id => 'fiel_fiel_private_key').set "12345678a"
    @driver.link(:id => 'fiel-login-button').click
    @driver.div(:class => 'alert alert-info text-left').wait_until_present
  end
end