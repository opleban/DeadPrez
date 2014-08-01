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
    puts "Whom would you like to send a message to?"
    print "Enter your friend's first name here:  "
  end

  def pause_then_reveal
    puts "Press enter to see message"
    gets.chomp
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
    puts
    puts
    pause_then_reveal
    puts "#{message}"
    puts "This message was sent to #{name} at #{number}"
  end

end