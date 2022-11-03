require "rubygems"
require "rest-client"
res = RestClient.get("https://wesmuehlhausen.com/index") # Get data from website page
puts res.code
puts res.body # prints body of page