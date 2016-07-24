require_relative 'weapon'

class Player

	DEFAULT_HP = 100
	DEFAULT_DAMAGE = 25

	attr_reader :name, :weapon, :hp

	def initialize name: nil
		name ||= "Computer"
		@name = name
		@hp = DEFAULT_HP
	end

	def choose_weapon weapon: nil
		@weapon = Weapon.new(type: weapon)
	end

	def take_damage amount: Kernel.rand(5..25)
		@hp -= amount
	end

end
