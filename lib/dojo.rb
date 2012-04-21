class Gun
  attr_reader :wait_time
  attr_reader :last_shot_at

  def initialize(wait_time)
    @wait_time = wait_time
    @state = "stopped"
  end

  def state
    if (Time.now - @last_shot_at >= @wait_time)
      return "stopped"
    end

    "wait"
  end

  def shot()
    if state() == "wait"
      return false
    end

    @last_shot_at = Time.now
    true
  end




end