require 'yaml'
class Weapon


	attr_reader :type

	def initialize type: nil
		@weapon_list = Game.weapon_list
		type ||= @weapon_list[Kernel.rand(0..@weapon_list.length-1)]
		@type = type
	end

	def score
		@weapon_list.index(@type)
	end	

end

