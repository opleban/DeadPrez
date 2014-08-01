require 'csv'

CSV.foreach("../../prezquotes.csv") do |line|
  Quote.create(quote: line[0])
end