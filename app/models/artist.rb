class Artist

  attr_reader :name, :years_experience
  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    self.class.all << self 
  end

  def self.all 
    @@all 
  end 

  # Return an array of all paintings by an artist
  def paintings
    Painting.all.select {|painting| painting.artist == self}
  end 

  #Return an array of all the galleries that an artist has paintings in 
  def galleries 
    self.paintings.map {|painting| painting.gallery}
  end 

  # Returns array of all cities an artist has paintings in
  def cities 
    self.galleries.map {|gallery| gallery.city}
  end 

  # Returns integer that is total experience of all artists
  def self.total_experience
    self.all.inject(0){|total, artist| total + artist.years_experience}
  end 

  # Helper method creates a hash where the keys are instances of Artist and the value is their total # paintings divided by total years of experience. Utilizing the Artist#painting method we already wrote.
  def self.construct_hash_of_experience
    # Algorithm: create a hash where the key is the instance of the artist and the value is the ratio of paintings to years of experience
    artist_production_rate = {}
    self.all.each do |artist|
      artist_production_rate[artist] = artist.paintings.size/artist.years_experience.to_f
    end 
    artist_production_rate
  end 

  #Returns instance of artist with highest amount of paintings per year of experience
  def self.most_prolific
    #only want the instance of artist, which is the key
    self.construct_hash_of_experience.max_by {|artist, experience| experience} 
  end 

  # Create a new painting belonging to this artist
  def create_painting(title, price, gallery)
    Painting.new(title, price, gallery, self)
  end 
end
