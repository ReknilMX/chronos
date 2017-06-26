# encoding: utf-8

require 'watir-webdriver'

browser = Watir::Browser.new :firefox # llamada al navegador

#Variables para el llenado de formularios:
site = "Italiannis" #Valores "Dominos", "Starbucks", "BurgerKing", "Chilis", "CPK", "PFC", "PeiWei", "Italiannis", "CCF", "Vips", "Porton", "Finca"
rfc = "HUAR681118BF7"
ticket = "50227228426" #9 digitos para Fastfood, de 11 a 18 para Restaurantes
store = "38169" #Solo aplica para Fastfood
date = "04/08/2016" #Usar Mascara DD/MM/AAAA, solo aplica para Fastfood
total = "255.0" #Dato solo para restaurantes
razon_social = "Kurtago, S.A. De C.V." #Obligatorio
nombres = "Ricardo Javier" #Obligatorio
apellidos = "Huacuja Acevedo" #Obligatorio
calle = "Martires De La Conquista" #Obligatorio
no_ext = "115" #Obligatorio
no_int = "Ed. B Depto 302" #opcional
colonia = "Escandón I Sección" #Obligatorio
municipio = "Gustavo A. Madero" #Obligatorio
ciudad = "Miguel Hidalgo" #Obligatorio
estado = "Distrito Federal" #Obligatorio
codigo_postal = "11800" #Obligatorio
correo_electronico = "rhuacujaing@facturame.mx" #Opcional

if (site == "Dominos" || site == "Starbucks" || site == "BurgerKing")
  browser.goto('https://alsea.interfactura.com/RegistroDocumento.aspx?opc=' + site)
  browser.text_field(:id => 'ctl00_Main_RegistroClienteTicket1_txtRFC').when_present.set rfc
  browser.text_field(:id => 'ctl00_Main_RegistroClienteTicket1_txtTicket').when_present.set ticket
  browser.text_field(:id => 'ctl00_Main_RegistroClienteTicket1_txtTienda').when_present.set store
  browser.text_field(:id => 'ctl00_Main_RegistroClienteTicket1_txtTienda').click
  browser.text_field(:id => 'ctl00_Main_RegistroClienteTicket1_txtTienda').send_keys :tab
  browser.text_field(:id => 'ctl00_Main_RegistroClienteTicket1_txtDate').send_keys [date[0],date[1],date[3],date[4],date[6],date[7],date[8],date[9]]
  browser.button(:id => 'ctl00_Main_RegistroClienteTicket1_btnContinue').click
  if browser.alert.exists? == true
    message = browser.alert.text
    browser.alert.ok
    browser.quit
    puts message
  else
    #Ingresa la información fiscal del RFC
    if rfc.length == 12
      browser.text_field(:id => 'ctl00_Main_ecClientes_txtNombre').when_present.set razon_social
    elsif rfc.length == 13
      browser.text_field(:id => 'ctl00_Main_ecClientes_txtNombre').when_present.set nombres
      browser.text_field(:id => 'ctl00_Main_ecClientes_txtApellido').when_present.set apellidos
    end 
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtCalle').when_present.set calle
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtNumExt').when_present.set no_ext
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtNumInt').when_present.set no_int
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtColonia').when_present.set colonia
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtMunicipio').when_present.set municipio
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtCiudad').when_present.set ciudad
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtEstado').when_present.set estado
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtCP').when_present.set codigo_postal
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtEmail').when_present.set correo_electronico
    browser.button(:id => 'ctl00_Main_ecClientes_btnSave').when_present.click #Guardar información
    browser.alert.ok #Cerrar mensaje de actualizacón exitosa
    browser.button(:id => 'ctl00_Main_ecClientes_btnContinuar').when_present.click #Continuar
    browser.button(:id => 'ctl00_Main_Facturacion_btnFacturar').when_present.click #Facturar
    browser.button(:id => 'ctl00_Main_Confirmacion1_btnSend').when_present.click #Enviar por correo
    browser.text_field(:id => 'ctl00_Main_Confirmacion1_txtNewMail').when_present.set correo_electronico
    browser.button(:id => 'ctl00_Main_Confirmacion1_btnSendDocument').when_present.click #Enviar por correo
    browser.quit
  end

elsif (site == "Chilis" || site == "CPK" || site == "PFC" || site == "PeiWei" || site == "Italiannis" || site == "CCF" || site == "Vips" || site == "Porton" || site == "Finca")
  browser.goto('https://alsea.interfactura.com/RegistroDocumento.aspx?opc=' + site)
  browser.text_field(:id => 'ctl00_Main_RegistroClienteTicket11_txtRFC').when_present.set rfc
  browser.text_field(:id => 'ctl00_Main_RegistroClienteTicket11_txtTicket').when_present.set ticket
  browser.text_field(:id => 'ctl00_Main_RegistroClienteTicket11_txtTotal').when_present.set total
  browser.button(:id => 'ctl00_Main_RegistroClienteTicket11_Button1').when_present.click
  if browser.alert.exists? == true
    message = browser.alert.text
    browser.alert.ok
    browser.quit
    puts message
  else
    #Ingresa la información fiscal del RFC
    if rfc.length == 12
      browser.text_field(:id => 'ctl00_Main_ecClientes_txtNombre').when_present.set razon_social
    elsif rfc.length == 13
      browser.text_field(:id => 'ctl00_Main_ecClientes_txtNombre').when_present.set nombres
      browser.text_field(:id => 'ctl00_Main_ecClientes_txtApellido').when_present.set apellidos
    end 
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtCalle').when_present.set calle
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtNumExt').when_present.set no_ext
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtNumInt').when_present.set no_int
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtColonia').when_present.set colonia
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtMunicipio').when_present.set municipio
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtCiudad').when_present.set ciudad
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtEstado').when_present.set estado
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtCP').when_present.set codigo_postal
    browser.text_field(:id => 'ctl00_Main_ecClientes_txtEmail').when_present.set correo_electronico
    browser.button(:id => 'ctl00_Main_ecClientes_btnSave').when_present.click #Guardar información
    browser.alert.ok #Cerrar mensaje de actualizacón exitosa
    browser.button(:id => 'ctl00_Main_ecClientes_btnContinuar').when_present.click #Continuar
    browser.button(:id => 'ctl00_Main_Facturacion_btnFacturar').when_present.click #Facturar
    browser.button(:id => 'ctl00_Main_Confirmacion1_btnSend').when_present.click #Enviar por correo
    browser.text_field(:id => 'ctl00_Main_Confirmacion1_txtNewMail').when_present.set correo_electronico
    browser.button(:id => 'ctl00_Main_Confirmacion1_btnSendDocument').when_present.click #Enviar por correo
    browser.quit
  end
else
  browser.quit
  message = "Restaurante no identificado"
  Puts message
end