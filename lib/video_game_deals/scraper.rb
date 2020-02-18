class Scraper
   
    
    def self.data
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