class SalesCli

  def call
    puts "Welcome to Game Deals!!"
    puts "To see Game sales, enter 'games'"
    puts "To miss out, enter 'nah'"
    Deal.scraped_data
    #binding.pry
    menu
  end

  def menu
    input = gets.strip.downcase

    if input == "games"
      games_sales
    elsif input == "nah"
      goodbye
    else
      invalid_entry
    end   
  end

  def invalid_entry
    puts "You must choose...Wisely."
    menu
  end
  
  def games_sales
    Deal.all.each_with_index do |deal, index|
      puts "#{index + 1}.  #{deal.title}"
    end 

    puts "What game do you want to see?"
    input = gets.strip

    game_selection(input)
  end 

  def game_selection(deal) 
    deal = Deal.find_by_index(deal)
        deal.each do |deal|
         puts " Name: #{deal.title}" 
         puts " Price: #{deal.price}"
         puts " Store: #{deal.store}"
         puts " Expiration: #{deal.expiration}"
        end
  end 

  def goodbye
    puts "All your base are belong to us!"
  end 

end
