require_relative 'view'
require 'twilio-ruby' 
 
# #credentials


def send_message(message, number)
    # set up a client to talk to the Twilio REST API 
    account_sid = 'ACe0f382eb45a66d4149b9d5cceb3db62a' 
    auth_token = '1c077e860040c141dc74877ad88e196b' 
    @client = Twilio::REST::Client.new account_sid, auth_token 
     
    @client.account.messages.create({
        :from => '+18144097739', 
        :to => number, 
        :body => message,  
    })
end

def create_message(quote, name)
    quote.gsub!("{{name}}", name)
end
 
View.welcome

recipient = gets.chomp
puts

invalid = true
while invalid
    print "Enter their phone number with here:  "
    number = gets.chomp
    invalid = false if number.length == 10
end

message = create_message(quote, recipient)
send_message(message, number)

