require 'nokogiri'
require 'open-uri'
require 'uri'



puts 'Enter First name of Desired Baseball Player'
first_name = gets
puts 'Enter Last name of Desired Baseball Player'
last_name = gets
puts 'Enter Desired Stats'
STDOUT.flush
list_of_stat = STDIN.gets.chomp.split(/,/)

# Lets go to Wikipedia
BASE_WIKIPEDIA_URL = "http://en.wikipedia.org"
LIST_URL = "#{BASE_WIKIPEDIA_URL}/wiki/#{first_name}_#{last_name}"

page = Nokogiri::HTML(open('http://en.wikipedia.org/wiki/David_Ortiz'))
rows = page.css('div.mw-content-text.mw-content-ltr table.infobox.bodered.vcard tr')

page.css('tr').each do |row|
	list_of_stat.each do |stat|
		if row.css('th a').text == stat
			print stat + ':' + ' ' + row.css('td').text + "\n"
		end
	end
end



