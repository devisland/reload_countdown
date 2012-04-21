class Gun
  attr_reader :wait_time
  attr_reader :state
  def initialize(wait_time)
    @wait_time = wait_time
  end

  def stopped()
    true
  end

  def shot()
    @state = "wait"
    true
  end


end