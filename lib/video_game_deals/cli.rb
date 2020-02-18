class SalesCli

  def call                                                      
    puts "Welcome to Game Deals!!"
    puts "To see Game sales, enter 'games'"
    puts "To miss out, enter 'nah'"
    Scraper.data
    menu
  end

  def menu
    input = nil
    loop do
      input = gets.strip
      break if input == "nah"

      if input.to_i> 0 && input.to_i <= Deal.all.length
        game_selection(input)
      elsif input == "games"
        games_sales
      else 
        invalid_entry
      end
    end    
    goodbye
  end

  def invalid_entry
    puts "You must choose...Wisely."
  end
  
  def games_sales
    Deal.all.each.with_index(1) do |deal, index|
      puts "#{index}.  #{deal.title}"
    end 
    puts "Enter the Number for the Game you like."
  end 

  def game_selection(input)
    g = Deal.find(input)
    puts "Title: #{g.title}"
    puts "Price: #{g.price}"
    puts "Store: #{g.store}"
    puts "#{g.expiration}"
    puts "Enter 'games' to return to the list. "
  end 

  
  def goodbye
    puts "All your base are belong to us!"
  end 

end
