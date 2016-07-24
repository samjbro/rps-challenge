require 'yaml'
class Round
	attr_reader :players

	def initialize player_1:, player_2:
		@score_array = Game.score_array
		@verb_array = Game.verb_array
		@players = [player_1, player_2]
	end

	def player_1
		@players.first
	end
	def player_2
		@players[1]
	end

	def execute
		deal_damage unless result[:winner].nil?
	end

	def result
		score_1 = player_1.weapon.score
		score_2 = player_2.weapon.score
		{winner: winner(score_1, score_2), verb: verb(score_1, score_2)}
	end

	def winner score_1, score_2
		case Game.score_array[score_1][score_2]#.values.first
		when "draw"
			nil
		when "win"
			player_1
		when "lose"
			player_2
		end
	end

	def verb score_1, score_2
		@verb_array[score_1][score_2]
	end

	def loser
		players.find { |player| player != result[:winner] }
	end
	private
	def deal_damage
		loser.take_damage
	end
end