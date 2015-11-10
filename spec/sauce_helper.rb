# You should edit this file with the browsers you wish to use
# For options, check out http://saucelabs.com/docs/platforms
require "sauce"

Sauce.config do |config|
	config[:username] = "mariogutierrez"
  config[:access_key] = "c43313c6-f280-4f98-96db-751f305ba0f3"
  config[:start_local_application] = false
  config[:start_tunnel] = false
  config[:browsers] = [
  	["Windows 8", "Internet Explorer", "10"],
  	#["Windows 7", "safari", "5"],
  	#["Linux", "googlechrome", "33"],
  	#["Linux", "Firefox", "10"],
  	#["OS X 10.9", "safari", "7"],
  	#["OS X 10.6", "Firefox", "28"]
  	]
end
