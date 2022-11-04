require "open-uri"
require "pry-byebug"


remote_base_url = "https://wesmuehlhausen.com"
remote_page_name = "index"
remote_full_url = remote_base_url + "/" + remote_page_name

puts remote_base_url
puts remote_page_name
puts remote_full_url

# binding.pry

remote_data = URI.open(remote_full_url).read # Get the data from the web page
my_local_file = File.open("my-downloaded-page.html", "w") # Can turn into different file types such as .txt

my_local_file.write(remote_data) # WRITE data INTO file
my_local_file.close # Close file