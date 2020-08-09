require 'open-uri'
require 'nokogiri'

# 35 most common musical genres of the 21st century
genres = ["Blues", "Classical", "Country", "Dance", "Drill", "Drum and Bass",
          "Dubstep", "Easy Listening", "Electronic Dance Music", "Emo", "Funk",
          "Folk", "Garage", "Grunge", "Grime", "Hip Hop", "House", "Indie",
          "Jazz", "K-Pop", "Latin", "Metal", "Motown", "Mod", "Opera", "Pop",
          "Punk", "Rap", "Reggae", "R&B", "Rock", "Soul", "Techno", "Trance",
          "World"]

puts "destroying genres"
Genre.destroy_all

puts "creating genres"

genres.each do |genre|
  Genre.create!(name: genre)
end

puts "#{Genre.count} genres created"

#  list of manufacturers

url = "https://en.wikipedia.org/wiki/List_of_bass_guitar_manufacturers"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

puts "destroying manufacturers"

Manufacturer.destroy_all
puts "scrapping wikipedia : list a bass manufacturers"
html_doc.search('.mw-parser-output > ul > li > a').each do |element|
  Manufacturer.create!(name: element.text.strip, website: "https://en.wikipedia.org#{element.attribute('href')}")
end

puts "end of scrapping : #{Manufacturer.count} manufacturers in the DB"

# list of bass guitarists

puts "destroying artists"
Artist.destroy_all

url = "https://en.wikipedia.org/wiki/List_of_bass_guitarists"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

puts "scrapping wikipedia page"

html_doc.search('.mw-parser-output > ul > li').each do |element|
  unless element.children.text.include?("List")
    infos = element.children.text.split("(")
    Artist.create!(name: infos[0], group: "#{infos.size == 2 ? infos[1][0...-1] : ''}")
  end
end

puts "end of scrapping, #{Artist.count} artists"



