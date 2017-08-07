require "sinatra"
require 'sendgrid-ruby'
include SendGrid


get "/home" do 
	@title = "Home"
	erb :home 
end

get "/about_us" do
	@title = "About us"
	erb :about_us
end

get "/contact_us" do 
	@title = "Contact Us"
	erb :contact_us
end

post "/contact_us" do 
	from = Email.new(email: 'mip12793@gmail.com')
	to = Email.new(email: 'mip12793@gmail.com')
	subject = 'Sending with SendGrid is Fun'
	content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
	mail = Mail.new(from, subject, to, content)

	sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
	response = sg.client.mail._('send').post(request_body: mail.to_json)
	puts response.status_code
	puts response.body
	puts response.headers

	erb :contact_us
end 


#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 

