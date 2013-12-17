require './game'
require './board'


game = Game.new
game.introduction
board = Board.new
board.init_view
game.start board