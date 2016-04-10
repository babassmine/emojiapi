require 'mechanize'

agent = Mechanize.new
links = %w(
http://www.alanwood.net/unicode/emoticons.html
http://www.alanwood.net/unicode/miscellaneous-symbols-and-pictographs.html
http://www.alanwood.net/unicode/transport-and-map-symbols.html
http://www.alanwood.net/unicode/enclosed-alphanumeric-supplement.html
)
links.each do |link|
page = agent.get(link)
table = page.search('table.unicode')
table_row = table[0].css('tr')
table_row.delete(table_row.first)
table_row = table_row.each do |row|
    data = row.children
    Emoji.create(char_dec: data[0].text, decimal: data[1].text, char_hex: data[2].text, hex: data[3].text, name: data[4].text)
end
end
