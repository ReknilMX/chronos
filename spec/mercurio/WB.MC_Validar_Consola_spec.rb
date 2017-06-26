require "mercurio_spec_helper"

describe "WB.MC Validar Portal" do

  include_context "config_web"

  it Time.now do
    @driver.goto 'http://localhost:6060/admin/'

    #Validaciones de encabezado
    assert @driver.element(:id => "logo").exists? == true
    assert @driver.element(:text => "Soporte").exists? == true
    assert @driver.element(:text => "Acceso emisión web").exists? == true
    assert @driver.a(:class => "twitter").exists? == true
    assert @driver.a(:class => "facebook").exists? == true
    assert @driver.a(:class => "youtube").exists? == true
    assert @driver.a(:class => "googleplus").exists? == true
    assert @driver.a(:class => "rss").exists? == true

    #Validaciones de contenido
    assert @driver.a(:text => "configuración").exists? == true
    assert @driver.a(:text => "consola").exists? == true
    assert @driver.a(:text => "errores").exists? == true
    assert @driver.a(:text => "salir").exists? == true

    #validaciones de pie de pagina
    assert @driver.a(:text => "GPTW").exists? == true
    assert @driver.a(:text => "SAT").exists? == true
    assert @driver.a(:text => "AMEXIPAC").exists? == true
    #assert @driver.text("DIVERZA © Copyright. Los nombres y logos de Buzón Fiscal®, Conector Fiscal® y Timbre Fiscal® son marcas registradas de Diverza Información y Análisis, SAPI de CV. Otros nombres y logos son marcas registradas de sus respectivos propietarios. Todo el contenido de este sitio y los documentos para descarga son propiedad intelectual de Diverza Información y Análisis, SAPI de CV.").exists? == true
    assert @driver.div(:css => '#footer > div > footer > div > div > div:nth-child(8)').text.include?("/DIVERZA © Copyright. Los nombres y logos de Buzón Fiscal®, Conector Fiscal® y Timbre Fiscal® son marcas registradas de Diverza Información y Análisis, SAPI de CV. Otros nombres y logos son marcas registradas de sus respectivos propietarios. Todo el contenido de este sitio y los documentos para descarga son propiedad intelectual de Diverza Información y Análisis, SAPI de CV./") == true
    assert @driver.a(:text => 'contacto@diverza.com').exists? == true
    assert @driver.a(:xpath => '//*[@id="footer"]/div/footer/div/div/div[7]/div[2]/text()').exists? == true

  end

end

describe "WB.MC login correcto" do

  include_context "config_web"

  it Time.now do
    @driver.goto 'http://localhost:6060/admin/'
    @driver.a(:text => "configuración").click
    @driver.text_field(:id => 'username').set "admin"
    @driver.text_field(:id => 'password').set "admin"
    @driver.button(:name => 'submitbutton').click
    assert @driver.element(:text => 'Guardar').exists? == true
  end

end

describe "WB.MC login incorrecto" do

  include_context "config_web"

  it Time.now do
    @driver.goto 'http://localhost:6060/admin/'
    @driver.a(:text => "configuración").click
    @driver.text_field(:id => 'username').set "admin"
    @driver.text_field(:id => 'password').set "1234"
    @driver.button(:name => 'submitbutton').click
    assert @driver.button(:name => 'submitbutton').exists? == true
  end

end
