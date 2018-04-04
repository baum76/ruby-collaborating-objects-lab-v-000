require "pry"
class Song
  attr_accessor :name, :artist

  @@all = []

  def initialize(name)
    @name = name
  end


  def self.new_by_filename(filename)
    artist = filename.split(" - ")[0]
    song = filename.split(" - ")[1]
    #binding.pry
    new_song = self.new(song)
    new_song.artist = Artist.find_or_create_by_name(artist)
    new_song
  end

  def self.find_by_artist(artist)
    Song.all.select do |song|
      song.artist == artist
    end
  end

  def self.all
    @@all << self
  end

  def artist_name(name)
    self.artist = Artist.find_or_create_by_name(name)
  end

  def save
    @@all << self
    self
  end
end
