class Deal
  attr_accessor :title, :price, :store, :expiration
  
  @@all = []


  def initialize
    @title = title 
    @price = price 
    @store = store 
    @expiration = expiration 
    save
  end 

  def save
      @@all << self
  end 

  def self.all
     @@all
  end 
 
  def self.find(input)
    self.all[input.to_i - 1]
  end  


  
end
