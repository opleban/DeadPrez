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

    puts "Who would you like to send a message to?"
    print "Enter your friend's name here:  "
  end
end