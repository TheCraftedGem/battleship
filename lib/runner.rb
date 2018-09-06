require './lib/battleship'
require "pry"

def play_game(battleship)
  loop do
    battleship.player_fires
    break if battleship.game_over
    puts battleship.computer.board.display
    battleship.end_turn

    battleship.computer_fires
    break if battleship.game_over
    puts battleship.player.board.display
    battleship.end_opposing_turn
  end
end

loop do
  puts `clear`
  battleship = Battleship.new

  battleship.start_game
  battleship.place_computer_ships
  battleship.place_first_ship
  battleship.place_second_ship
  battleship.player.set_up_ships

  play_game(battleship)
end