require 'csv'
require_relative '../config/application'
require_relative '../app/models/presidents'
require_relative '../app/models/quotes'

CSV.foreach("/Users/alexbirdsall/DBC/DeadPrez/prezquotes.csv") do |line|
  if President.where('name=?', line[1]).empty?
    president = President.create(name: line[1])
  else
    president = President.where('name=?', line[1])[0]
  end
  quote = Quote.create(quote: line[0])
  president.quotes << quote
end