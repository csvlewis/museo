require './lib/photograph'
require './lib/artist'
require 'csv'

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

  def find_photographs_by_artist(artist)
    @photographs.find_all { |photo| photo.artist_id == artist.id }
  end

  def artists_with_multiple_photographs
    artist_ids = @photographs.map {|photo| photo.artist_id}
    prolific_artist_ids = artist_ids.select{ |id| artist_ids.count(id) > 1}.uniq
    prolific_artists = []
    @artists.each do |artist|
      prolific_artist_ids.each do |id|
        if artist.id == id
          prolific_artists << artist
        end
      end
    end
    prolific_artists
  end

  def photographs_taken_by_artist_from(country)
    artists_from_country = @artists.find_all { |artist| artist.country == country }
    artist_ids = artists_from_country.map { |artist| artist.id }
    photographs_from_country = []
    @photographs.each do |photo|
      artist_ids.each do |id|
        if photo.artist_id == id
          photographs_from_country << photo
        end
      end
    end
    photographs_from_country
  end

  def photographs_taken_between(range)
    years = range.to_a
    photos_taken = []
    @photographs.each do |photo|
      years.each do |year|
        if photo.year == year.to_s
          photos_taken << photo
        end
      end
    end
    photos_taken
  end

  def artists_photographs_by_age(artist)
    photos = find_photographs_by_artist(artist)
    photos_by_age = {}
    photos.each do |photo|
      photos_by_age[photo.year.to_i - artist.born.to_i] = photo.name
    end
    photos_by_age
  end

  def load_photographs(file_path)
  end

  def load_artists(file_path)
  end
end
