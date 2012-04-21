class Gun
  attr_reader :wait_time
  attr_reader :state

  def initialize(wait_time)
    @wait_time = wait_time
    @state = "stopped"
  end

  def shot()
    if @state == "wait"
      return false
    end

    @state = "wait"

    true
  end


end