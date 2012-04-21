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

  def reloading?
    @reload_time > 0
  end

  def shot()
    return false unless reloading?

    @reload_time = @wait_time
  end




end