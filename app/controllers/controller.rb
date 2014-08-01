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
    quote.quote.gsub!("{{name}}", name) + "\n\nLove, #{quote.president.name}"
  end

  def get_recipient_name
    default_name = ["Buddy", "Bro", "Friend", "Countryman", "Fellow Patriot", "Slugger"]
    View.prompt_for_recipient
    recipient = gets.chomp
    recipient.empty? ? default_name.sample : recipient
  end

  def get_recipient_number
    valid = false

    View.prompt_for_number
    num = gets.chomp
    until valid_number?(num)
      View.bad_number
      View.prompt_for_number
      num = gets.chomp
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
    number_match = number.match(/(\d{3})(\d{3})(\d{4})/)
    "(#{number_match[1]}) #{number_match[2]}-#{number_match[3]}"
  end

  def confirm(recipient, number)
    View.ask_for_confirmation(recipient, number)
    y_or_n = gets.chomp
    exit if ["no", "n"].include?(y_or_n.downcase) 
  end

  def log_call(name, number, quote)
    CallLog.create(name: name, number: number, president: quote.president)
  end


  def run_main
    View.welcome
    recipient = get_recipient_name
    number = get_recipient_number
    quote = get_random_quote
    message = create_message(quote, recipient)
    formatted_number = format_num(number)
    confirm(recipient, formatted_number)
    Controller.send_message(message, number)
    log_call(recipient, number, quote)
    View.confirm_message(recipient, message, format_num(number))
  end
end


