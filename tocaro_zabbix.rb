require 'net/http'
require 'uri'
require 'json'
require 'openssl'

webhookUri = "https://hooks.tocaro.im/integrations/inbound_webhook/" + ARGV[0]
title = ARGV[1]
message = ARGV[2]

uri = URI.parse(webhookUri)

params = { text: "CTCS-Tracon infomation", color: "info", attachments:[{title: title,value: message},{}] }
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

http.set_debug_output $stderr

http.start do |h|
  request = Net::HTTP::Post.new(uri.path)
  request.set_form_data(payload: params.to_json)
  response = h.request(request)
  end
~        
