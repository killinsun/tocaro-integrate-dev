require 'net/http'
require 'uri'
require 'json'
require 'openssl'


webhookUrl = "[[[insert your webhook uri ]]]"

uri = URI.parse(webhookUrl)

params = { text: "test", color: "info", attachments:[{title: "Tocaro integration API test.",value: "This message was send by take-lindev."},{}] }

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

http.set_debug_output $stderr

http.start do |h|
	request = Net::HTTP::Post.new(uri.path)
	request.set_form_data(payload: params.to_json)
	response = h.request(request)
	end
