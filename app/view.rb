module View
  extend self

  def welcome
    puts "-------------------------------------------------"
    puts "          Welcome to Dead Presidents"
    puts "-------------------------------------------------"

    sleep(1)
    puts
    puts "             'E Pluribus, Texts'"
    puts
    puts
    sleep(1)

    puts "-------------------------------------------------"
    puts 
    puts "-------------------------------------------------"
  end

  def prompt_for_recipient
    puts "Who would you like to send a message to?"
    print "Enter your friend's name here:  "
  end

  def format_number(number)
    number_match = number.match(/(\d{3})(\d{3})(\d{4})/)
    "(#{number_match[1]})-#{number_match[2]}-#{number_match[3]}"
  end

  def confirm_message(name, message, number)
    puts "Your message is enroute."
    puts "-------------------------------------------------"
    puts 
    puts "-------------------------------------------------"
    puts
    puts "On the way...patience!" 
    sleep(1)
    puts "-------------------------------------------------"
    puts 
    puts "-------------------------------------------------"
    sleep(1)
    puts "Huzzah!" 
    puts "#{message}"
    puts "This message was sent to #{name} at #{number}"
  end

end