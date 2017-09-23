require 'net/http'
require 'uri'
require 'json'
require 'openssl'

title = ARGV[0]
message = ARGV[1]
webhookUri = ""

uri = URI.parse(webhookUrl)

params = { text: "", color: "info", attachments:[{title: $title,value: $message},{}] }

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

http.set_debug_output $stderr

http.start do |h|
  request = Net::HTTP::Post.new(uri.path)
  request.set_form_data(payload: params.to_json)
  response = h.request(request)
  end
