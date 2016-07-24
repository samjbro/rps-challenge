class Game
	attr_reader :players
	attr_reader :round

	def initialize player_1: , player_2: nil
		player_2 ||= Player.new
		@players = [player_1, player_2]
	end

	def player_1
		@players.first
	end

	def player_2
		@players.last
	end

	def self.create player_1: , player_2:
		@game = Game.new(player_1: player_1, player_2: player_2)
	end

	def self.instance
		@game
	end

	
	def start_round
		@round = Round.new(player_1: player_1, player_2: player_2)
	end

	# def end_round
	# 	@round.execute
	# end

end