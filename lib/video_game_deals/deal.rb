class Deal
  attr_accessor :title, :price, :store, :expiration, :index
  
  @@all = []

  @@index = 0 

  def initialize
    @title = title 
    @price = price 
    @store = store 
    @expiration = expiration 
    @@index += 1
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
  end  
end
