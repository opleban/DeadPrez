require 'sinatra'
require_relative 'view'
require 'twilio-ruby' 


def create_message(quote, name)
  quote.gsub!("{{name}}", name)
end


View.welcome

module Controller
  include View
  extend self

  def send_message(message, number)
    account_sid = 'ACe0f382eb45a66d4149b9d5cceb3db62a' 
    auth_token = '1c077e860040c141dc74877ad88e196b' 
    @client = Twilio::REST::Client.new account_sid, auth_token 

    @client.account.messages.create({
      :from => '+18144097739', 
      :to => number, 
      :body => message,  
      })
    end
  end

  def get_recipient_name
    DEFAULT_NAME = ["buddy", "bro", "friend", "countryman", "fellow patriot"]
    View.recipient_prompt
    recipient = gets.chomp
    recipient || DEFAULT_NAME.sample
  end

  def get_recipient_number
    valid = false
    loop do
      print "Enter your friend's phone number here:  "
      number = gets.chomp
      break if number.valid
      puts "That number was invalid. Please enter a valid number."
    end
    number
  end

  def valid_number?(number)
    /\d{10}\z/ =~ number ? true : false
  end

  def run_main
    View.welcome
    name = get_recipient_name
    number = get_recipient_number
    message = self.create_message(quote, recipient)
    Controller.send_message(message, number)
  end
end


