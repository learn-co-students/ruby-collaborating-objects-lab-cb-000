puts(Dir.entries("./spec/fixtures/mp3s"))
puts("\n\n\n")

Dir.entries("./db/mp3s").each do |song| 
  songs = song.split(" - ")
  artist = songs[0]
  title = songs[1]
  genre = songs[2]
  next if genre.class !=String
  genre = genre.split(".")[0]
  puts("Artist: #{artist}, Song: #{title}, Genre: #{genre.class}")
end
