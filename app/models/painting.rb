# Painting will be our joiner class, meaning it will have attributes that are instances of Gallery and Artist classes
class Painting

  attr_reader :title, :price, :gallery, :artist 

  @@all = []

  def initialize(title, price, gallery, artist)
    @title = title
    @price = price
    @gallery = gallery
    @artist = artist
    self.class.all << self 
  end

  def self.all 
    @@all 
  end 

  # Returns integer that is total price of all paintings
  def self.total_price
    self.all.inject(0){|total, painting| total + painting.price}
  end 

end
