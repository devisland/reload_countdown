class Gun
  attr_reader :wait_time

  def initialize(wait_time)
    @wait_time = wait_time
  end

  def state
    if @last_shot_at.nil? or
       (Time.now - @last_shot_at >= @wait_time)
      return :ready
    end

    :reloading
  end

  def shot()
    if state == :reloading
      return false
    end

    @last_shot_at = Time.now
    true
  end




end