require 'bundler'
Bundler.require
require_relative 'lib/game'
require_relative 'lib/player'
player1 = Player.new("Josiane")
player2 = Player.new("José")
puts "Voici l'état de chaque jouer"
puts " #{player1.show_state} "
puts " #{player2.show_state} "
puts "Passons à la phase d'attaque"

	loop{
			puts player1.attacks(player2)
			puts player2.show_state
			puts player2.attacks(player1)
			puts player1.show_state
			if player1.life_points < player2.life_points
			  	puts "---------------#{player2.name} WINS this round-----------------"
			  elsif
			  	puts "---------------#{player1.name} WINS this round-----------------"
 
			  end

			break if (player1.life_points <=0 || player2.life_points <=0)

        }
puts 
puts
if player1.life_points <= 0
		puts " ==================>#{player2.name} IS WINNER<================="
else player2.life_points <= 0
	    puts " ==================>#{player1.name} IS WINNER<================="
end
puts
puts