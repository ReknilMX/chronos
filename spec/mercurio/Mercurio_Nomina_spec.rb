# encoding: utf-8

require "mercuriospec_helper"

describe "Mercurio - CP01 - Todos Campos Con Nomina" do

  include_context "config_app"

  it Time.now do
    test_dir = Dir[Rails.root.join "spec/mercurio/resources/*.yaml"]
    test_dir.each do |filename|
      name = File.basename('CP01- Todos Campos Con Nomina', '.yaml')[0,4]
      mercurio_folder = MERCURIOAPP_CONFIG['mercurioDIR'] + "data/in/"
      FileUtils.cp(filename, mercurio_folder)
    end

    #Validacion de procesamiento en LOG
    #watch_for(MERCURIOAPP_CONFIG['mercurioDIR']+"support/logs/mercurio.log", /HTTP code: 200/)
    sleep(2)
    watch_for(MERCURIOAPP_CONFIG['mercurioDIR']+"support/logs/mercurio.log", /HTTP code: 200/)
    assert @line.should include "HTTP code: 200"
    assert @line.should include Time.now.strftime("%Y/%m/%d %H:%M")


    #Validaciones de schema
    xsd = Nokogiri::XML::Schema(File.read(Rails.root.join "spec/mercurio/resources/schemas/cfdv32.xsd"))
    doc = Nokogiri::XML(File.read(MERCURIOAPP_CONFIG['mercurioDIR'] + "data/out/" + "/CP01- Todos Campos Con Nomina.xml"))
    xsd.validate(doc).each do |error|
      puts error.message
    end

    #Validaciones de dato de salida
    document = Nokogiri::XML(File.read(MERCURIOAPP_CONFIG['mercurioDIR'] + "data/out/" + "/CP01- Todos Campos Con Nomina.xml"))
    assert document.xpath("//cfdi:Comprobante/@NumCtaPago").first.value.should == "0987"
  end

end
