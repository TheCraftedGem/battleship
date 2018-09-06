class Text
  def welcome
    "\n\n\nWelcome to BATTLESHIP\n"
  end

  def intro
    "\nWould you like to (p)lay, (i)nstructions, (q)uit?\n"
  end

  def invalid(example)
    "\nInvalid input! Please enter a ships start and end coordinates.
For example: '#{example}'\n"
  end

  def bad_input
    "please enter a valid character\n"
  end

  def not_destroyer
    "\nC'mon now! Place a ship that is three spaces long and does not
land on top of another ship.\n"
  end

  def not_cruiser
    "\nI said enter a ship that's two spaces long. Example: 'A1 A2'"
  end

  def input
    print "> "
    input = gets.chomp.upcase
    exit if input == 'Q'
    input
  end

  def instructions
    "\nINSTRUCTIONS: Each player calls out one shot (or coordinate) each
turn in attempt to hit one of their opponent’s ships. To hit one of your
opponent’s ships, you must enter a letter and a number of where you think
one of their ships is located. Once a shot is called, the opponent calls
out hit or miss. If one of your ships gets hit, it will be indicated by
the letter 'H' on the board. If calling a shot (or trying to hit your
opponent’s ships), a mark 'H' for hit and 'M' for miss will appear at
that spot. This will help you keep track of your hits and misses in your
hunt to find their ships. Once all spots on a ship have been filled with
an 'H', a ship has sunk and the 'H' markings on the board for that ship
will turn to 'X's. The first player to sink all the opponents ships wins.\n"
  end

  def quit_game
    "\nQuitting game!!\n"
  end

  def computer_place_ships
      "\nI have laid out my ships on the grid.
You now need to layout your two ships.
The first is two units long and the
second is three units long.
The grid has A1 at the top left and D4 at the bottom right.\n"
  end

  def cruiser
    "\nEnter the squares for the cruiser ship:\n"
  end

  def cruiser
    "\nEnter the squares for the destroyer ship:\n"
  end

  def placed
    "\nShip has been placed\n"
  end

  def decision(input)
    if input == "P"
      return true
    elsif input == "I"
      puts instructions
    elsif input == "Q"
      puts quit_game
      exit
    else
      puts bad_input
    end
  end

  def restart_prompt
    "Enter 'r' to restart or 'q' to quit\n"
  end

  def enter_position
    "\nEnter a position to fire on: "
  end

  def cant_fire
    "You cant fire on that position!!!
Position either doesn't exist or you have already fired on it.\n"
  end

  def miss(entry)
    "Your shot at #{entry} was a miss..."
  end

  def hit(entry)
    "Your shot at #{entry} was a hit! Nice work captain!\n"
  end

  def miss_comp(entry)
    "The computer fired at #{entry} but missed..\n"
  end

  def hit_comp(entry)
    "The computer fired and hit your ship at #{entry}!\n"
  end

  def end_turn
    "\nIf you would like to end your turn press ENTER"
  end

  def end_opposing_turn
    "\nPress ENTER"
  end

  def sunk_ship(name)
    "\nYou have sunken the opponents #{name}!\n"
  end

  def comp_sunk(name)
    "\nYour opponent has sunken your #{name}!!\n"
  end

  def winner(time, turns)
    "That was the last of your opponents ships..\n
Congratulations! YOU WON!!
And you did it in #{turns} turns, #{time[0]} minutes, and #{time[1]} seconds."
  end

  def loser
    "You lose, good luck next time!\n"
  end

  def enter
    gets.chomp
  end
end