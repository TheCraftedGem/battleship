module Turns
  def end_turn
    print @text.end_turn
    @text.enter
    puts `clear`
  end

  def add_turn
    @turns += 1
  end

  def end_opposing_turn
    print @text.end_opposing_turn
    @text.enter
    puts `clear`
  end
end