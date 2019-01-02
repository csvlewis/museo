require 'minitest/autorun'
require './lib/artist'

class ArtistTest < Minitest::Test
  def test_it_exists
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist = Artist.new(attributes)

    assert_instance_of Artist, artist
  end

  def test_it_has_an_id
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist = Artist.new(attributes)

    assert_equal "2", artist.id
  end

  def test_it_has_a_name
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist = Artist.new(attributes)

    assert_equal "Ansel Adams", artist.name
  end

  def test_it_has_a_birth_year
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist = Artist.new(attributes)

    assert_equal "1902", artist.born
  end

  def test_it_has_a_death_year
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist = Artist.new(attributes)

    assert_equal "1984", artist.died
  end

  def test_it_has_a_country
    attributes = {
      id: "2",
      name: "Ansel Adams",
      born: "1902",
      died: "1984",
      country: "United States"
    }
    artist = Artist.new(attributes)

    assert_equal "United States", artist.country
  end
end
