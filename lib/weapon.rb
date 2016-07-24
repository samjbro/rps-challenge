require 'yaml'
class Weapon

TYPES = YAML.load_file('./public/rpsls_weapons.yml')

	attr_reader :type

	def initialize type: nil
		type ||= TYPES[Kernel.rand(0..TYPES.length-1)]
		@type = type
	end

	def score
		TYPES.index(@type)
	end	

end

