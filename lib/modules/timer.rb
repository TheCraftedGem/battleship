module Timer
  def timer(time = Time.now)
    seconds = (time - @start_time).to_i
    minutes = seconds / 60
    Array.new.push(minutes, (seconds - minutes * 60))
  end
end