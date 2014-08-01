require 'sinatra'
require_relative '../view'
require 'twilio-ruby' 

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

  def create_message(quote, name)
    quote.gsub!("{{name}}", name)
  end

  def get_recipient_name
    default_name = ["buddy", "bro", "friend", "countryman", "fellow patriot"]
    View.prompt_for_recipient
    recipient = gets.chomp
    recipient.split(/ /)[0] || default_name.sample
  end

  def get_recipient_number
    valid = false
    while true
      print "Enter your friend's phone number here:  "
      num = gets.chomp
      break if valid_number?(num)
      puts "That number was invalid. Please enter a valid number."
    end
    num
  end

  def valid_number?(number)
    /\d{10}\z/ =~ number ? true : false
  end

  def get_random_quote
    Quote.all.sample
  end

  def format_num(number)
    p number
    number_match = number.match(/(\d{3})(\d{3})(\d{4})/)
    "(#{number_match[1]})-#{number_match[2]}-#{number_match[3]}"
  end


  def run_main
    View.welcome
    recipient = get_recipient_name
    number = get_recipient_number
    # quote = get_random_quote
    quote = "{{name}}, the bridge is yours. -Capt. Jean Luc Picard"
    message = create_message(quote, recipient)
    # Controller.send_message(message, number)
    View.confirm_message(recipient, message, format_num(number))
  end
end


