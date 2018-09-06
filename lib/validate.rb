require './lib/modules/validation'

class Validate
  include Validation
  def valid(input)
    valid_form(input) && valid_letts(input) && valid_nums(input)
  end


  def valid_letts(input)
    input.split(" ").select do |point|
      if letters.include?(point[0])
        point[0]
      end
    end.length == 2
  end

  def letters
    ['A', 'B', 'C', 'D']
  end

  def get_letts(input)
    [input[0], input[3]].sort
  end

  def get_nums(input)
    [input[1].to_i, input[4].to_i].sort
  end

  def same_row(input)
    get_letts(input).uniq.length == 1
  end

  def same_col(input)
    get_nums(input).uniq.length == 1
  end

  def destroyer(input)
    if same_row(input)
      get_nums(input)[1] - get_nums(input)[0] == 2
    elsif same_col(input)
      (letters.index(get_letts(input)[1]) - letters.index(get_letts(input)[0])) == 2
    else
      false
    end
  end

  def cruiser(input)
    if same_row(input)
      get_nums(input)[1] - get_nums(input)[0] == 1
    elsif same_col(input)
      (letters.index(get_letts(input)[1]) - letters.index(get_letts(input)[0])) == 1
    else
      false
    end
  end

  def same_row_expand(input)
    nums = ((get_nums(input)[0].to_s)..(get_nums(input)[1].to_s)).to_a
    letters = get_letts(input).push(get_letts(input)[0])
    letters.map.with_index {|let, idx| let + nums[idx] }
  end

  def same_col_expand(input)
    letters = (get_letts(input)[0]..get_letts(input)[1]).to_a
    nums = [get_nums(input)[0].to_s, get_nums(input)[0].to_s, get_nums(input)[0].to_s]
    letters.map.with_index {|let, idx| let + nums[idx]}
  end

  def expand(input)
    if same_row(input)
      same_row_expand(input)
    elsif same_col(input)
      same_col_expand(input)
    else
      false
    end
  end
end
