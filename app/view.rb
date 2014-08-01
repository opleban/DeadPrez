module View
  extend self

  def print_latin_motto
    "'E Pluribus, Texts'".each_char do |char|
      print char
      sleep(0.1)
    end
    puts
  end

  def welcome
    puts "-------------------------------------------------"
    puts "          Welcome to Dead Presidents"
    puts "-------------------------------------------------"

    sleep(1)
    puts
    print "             "
    print_latin_motto
    puts
    sleep(0.2)

    puts "-------------------------------------------------"
    puts 
    puts "-------------------------------------------------"
    sleep(1)
  end

  def prompt_for_recipient
    puts "Whom would you like to send a message to?"
    print "Enter your friend's first name here:  "
  end

  def prompt_for_number
    print "Enter your friend's phone number here:  "
  end

  def bad_number
    puts "That number was invalid. Please enter a valid number."
  end

  def pause_then_reveal
    puts "Press enter to see message"
    gets.chomp
  end

  def ask_for_confirmation(recipient, number)
    puts "Are you sure you'd like to send a message from a dead president to #{recipient} at #{number}?"
    print "yes or no?  "
  end

  def confirmation_message(name, message, number)
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
    puts "\"#{message}\""
    puts
    puts "This message was sent to #{name} at #{number}"
  end

end