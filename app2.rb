require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

@player1
@player2
@human
@enemies = []


def welcome
  puts "---------------------------------------"
  puts "BIENVENUE DANS CE NOUVEAU JEU DE COMBAT"
  puts "LE BUT DU JEU EST DE TUER TES ENNEMIES"
  puts "---------------------------------------"
end

def create_human_player
  puts "Quel est ton prénom ?"
  print "> "
  return @human = HumanPlayer.new(gets.chomp)
puts "Bienvenue #{@human.name} et bonne chance !"
end

def create_robot_player
  @player1 = Player.new("Josianne")
  @player2 = Player.new("José")
  @enemies << @player1
  @enemies << @player2
end

def fight
  while @human.life_points >0 && (@player1.life_points > 0 || @player2.life_points >0)
    puts "\n"
    puts "Que veux-tu faire ?"
    puts "\n"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts "attaquer un joueur en vue :"
    puts "0 - Josiane a 10 points de vie"
    puts "1 - José a 10 points de vie"
  
    action = gets.chomp.to_s

    if action == "a"
      @human.search_weapon
    elsif action == "s"
      @human.search_health_pack
    elsif action == "0"
      @human.attacks(@player1)
    elsif action == "1"
      @human.attacks(@player2)
    end

    puts "\n"
    puts "Les ennemies ripostent"
    @enemies.each {|item| item.life_points <=0 ? break : item.attacks(@human)}
    @human.show_state
  end

  puts "La partie est finie" 
  if @human.life_points > 0
    puts "Bravo CHAMPION, tu as gagné"
  else
    puts "T'es mort Loooooooooser"
  end
end

def perform
  welcome
  create_human_player
  create_robot_player
  fight
end

perform
