class Gun
  attr_reader :wait_time
  attr_reader :reload_time

  def initialize(wait_time)
    @wait_time = wait_time
  end

  def state
    if @last_shot_at.nil? or
       (Time.now - @last_shot_at >= @wait_time) or
          (@reload_time == 0)
      return :ready
    end

    :reloading
  end

  def timeElapsed(seconds)
    @reload_time = @reload_time - seconds;
  end

  def shot()
    if state == :reloading
      return false
    end

    @last_shot_at = Time.now
    true
  end




end