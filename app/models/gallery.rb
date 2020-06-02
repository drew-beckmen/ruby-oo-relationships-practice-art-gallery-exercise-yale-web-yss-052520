class Gallery

  attr_reader :name, :city
  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    self.class.all << self 
  end

  def self.all 
    @@all 
  end 

  # Returns an array of all paintings in a gallery
  def paintings 
    Painting.all.select {|painting| painting.gallery == self}
  end 

  # Returns an array of all artists that have paintings in a gallery
  def artists 
    self.paintings.map {|painting| painting.artist}
  end 

  # Returns array of the names of all artists that have a painting in the gallery
  def artist_names
    self.artists.map {|artist| artist.name}
  end
  
  # Returns an instance of the most expensive painting in a gallery
  def most_expensive_painting 
    self.paintings.max_by {|painting| painting.price}
  end 
end
