class Player 
  attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def show_state
    if @life_points <= 0
      puts "#{@name} a 0 point de vie"
    else 
      puts "#{@name} a #{@life_points} de vie"
    end
  end

  def gets_damage(damage)
    @life_points = @life_points - damage
    if @life_points <=0
      "#{name} a été tué"
    else
      show_state
    end
  end

  def attacks(player)
    damage = compute_damage
      puts "#{self.name} attaque #{player.name}"
      puts "il lui inflige #{damage} points de dommage"
      player.gets_damage(damage)
  end

  def compute_damage
    return rand(1..6)
  end
  
end 

class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    super(name)
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    if @life_points <= 0
      puts "#{@name} a 0 point de vie et une arme de niveau #{@weapon_level}"
    else 
      puts "#{@name} a #{@life_points} de vie et une arme de niveau #{@weapon_level}"
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_level2 = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_level2}"
    if weapon_level2 > @weapon_level
      @weapon_level = weapon_level2
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else weapon_level2 < @weapon_level
      puts "M%$de pas de chance, elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    new_health_pack = rand(1..6)

    if new_health_pack == 1
      puts ">>> Tu n'as rien trouvé..."

    elsif new_health_pack >= 2 && new_health_pack <= 5
      puts ">>> Bravo, tu as trouvé un pack de +50 points de vie !"

      if @life_points >= 50
        @life_points = 100
      else
        @life_points = @life_points + 50
      end
    else
      puts ">>> Waow, tu as trouvé un pack de +80 points de vie !"
      if @life_points >= 20
        @life_points = 100
      else
        @life_points = @life_points + 80
      end
    end
  end
end
