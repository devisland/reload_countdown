class Gun
  attr_reader :wait_time
  attr_reader :reload_time

  def initialize(wait_time)
    @wait_time = wait_time
    @reload_time = 0
  end

  def timeElapsed(seconds)
    @reload_time = @reload_time - seconds;
  end

  def ready?
    @reload_time.nil? || @reload_time == 0
  end

  def reloading?
    @reload_time > 0
  end

  def shot()
    return false if reloading?

    @reload_time = @wait_time
    true
  end




end