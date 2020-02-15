class Deal
  attr_accessor :title, :price, :store, :expiration
  
  @@all = []
=begin  
  def initialize(attr_hash)
    attr_hash.each do |k, v|
     self.send("#{k}=", v) if self.respond_to?("#{k}=")
    end
     save
  end 
=end 

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
 
  def self.find_by_index(input)
      all.select do |deal|
          input == index
      end 
  end 


  def self.scraped_data
    html = open('https://www.dealzon.com/gaming')
    doc = Nokogiri::HTML(html)
    container = doc.css("div.content_container")
    container.each do |b|
       deal = Deal.new
       deal.title = b.css('h2 a').text
       deal.price = b.css('span.price').text
       deal.store = b.css('span.section_2').text
       deal.expiration = b.css('span.section_3').text
       deal  
    end 
    #binding.pry
    
    
  end

  
end
