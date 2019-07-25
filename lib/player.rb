require 'pry'

#*************************************class Player***********************
class Player
	attr_accessor :name, :life_points 
	def initialize(player_name)        #Create payers
		@life_points = 10
		@name = player_name
		
	end

	#status of a player
	def show_state
		puts "#{@name} qui a #{@life_points} points de vie"
	end

	#Undergo an attack
	def gets_damage(damage)
		@life_points -= damage #rest of a life points
		print "" if @life_points <= 0
	end

	#Attack
	def attacks(player_undergoing_attack)
		puts "#{@name} attaque #{player_undergoing_attack.name} "
		damages = compute_damage
		puts "il lui inflige #{damages} points de dommages"
		player_undergoing_attack.gets_damage(damages)

	end
	#Compute the damage
	def compute_damage
		return rand(1..6)
	end
end



#*************************************HumanPlayer class***********************

class HumanPlayer < Player
	attr_accessor :weapon_level
	def initialize(name)
		super (name)
		@life_points = 100
		@weapon_level = 1
		
	end

	def show_state
		puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
    	rand(1..6)*@weapon_level
    end

    #Search a new weapon
    def search_weapon
    	weapon_new_level = rand(1..6)
    	puts "Tu as touvé une arme de niveau #{weapon_new_level}"
    	  if @weapon_level < weapon_new_level
    	  	puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends"
    	  	
    	  	@weapon_level = weapon_new_level
    	  else @weapon_level >= weapon_new_level
    	  	puts "elle n'est pas mieux que ton arme actuelle..."
    	  end
    end 
    #search health pack
    def search_health_pack
    	health = rand(1..6)
    	if health == 1
    		puts "Tu n'a rien trouvé..."
    	elsif (2 <= health && health <= 5)
    		puts "Tu a trouvé un pack de +50 points de vie"
    		@life_points += 50
    		if @life_points <=100
    		  puts "Vous avez alors #{@life_points}"
    	    else
    	    	@life_points = 100
    	    	puts "Vous avez le maximum de point de vie: #{@life_points}"
    	    end
    	else health == 6
    	    	puts "Waow, tu as trouvé un pack de +80 points de vie !"
    	    	@life_points += 80
    	    if @life_points <=100
    		    puts "Vous avez alors #{@life_points} points de vie"
    	    else 
    	    	@life_points = 100
    	    	puts "Vous avez le maximum de point de vie: #{@life_points}"
    	    end
    	end
    end

end



