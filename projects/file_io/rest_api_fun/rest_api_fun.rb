require "rubygems"
require "rest-client"
res = RestClient.get("https://wesmuehlhausen.com/index") # Get data from website page
# puts res.code
# puts res.body # prints body of page

scraper = RestClient.get("https://raw.githubusercontent.com/first20hours/google-10000-english/master/google-10000-english-no-swears.txt")
puts scraper.body

my_local_file = File.open("words.txt", "w") # Can turn into different file types such as .txt
my_local_file.write(scraper.body) # WRITE data INTO file
my_local_file.close # Close file