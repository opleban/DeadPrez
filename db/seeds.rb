require 'csv'

CSV.foreach("../../prezquotes.csv") do |line|
  president = President.create(name: line[1])
  quote = Quote.create(quote: line[0])
  quote.president = president
end