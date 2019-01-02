require './lib/photograph'
require './lib/artist'
class Curator
  attr_reader :artists,
              :photographs
  def initialize
    @artists = []
    @photographs = []
  end

  def add_photograph(data)
    photo = Photograph.new(data)
    @photographs << photo
  end

  def add_artist(data)
    artist = Artist.new(data)
    @artists << artist
  end

  def find_photograph_by_id(id)
    @photographs.select { |photo| photo.id == id }.first
  end

  def find_artist_by_id(id)
    @artists.select { |artist| artist.id == id}.first
  end
end
