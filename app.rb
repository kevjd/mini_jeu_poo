require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def fight (player1, player2)

  while player1.life_points > 0 && player2.life_points > 0
    puts "Voici l'état de chaque joueur :"
    player1.show_state
    player2.show_state

    puts "Passons à la phase d'attaque pour #{player1.name} :"
    player1.attacks (player2)

    if player2.life_points <= 0
      puts "Le joueur #{player2.name} a été tué"
      break
    end

    puts "Passons à la phase d'attaque pour #{player2.name} :"
    player2.attacks (player1)

    if player1.life_points <= 0
      puts "Le joueur #{player1.name} a été tué"
      break
    end
    puts "\n"
    puts "------------"
    puts "\n"
  end
end


def perform
  player1 = Player.new("Josianne")
  player2 = Player.new("José")
  fight(player1, player2)
end

perform


