require "spec_helper"

describe Gun do
  context "a gun with wait_time of 2 seconds" do
    subject{Gun.new(2)}
    its(:wait_time){should be(2)}
    it "starts stopped" do
      subject.state.should == "stopped"
    end

    it "shot" do
      subject.shot.should be_true
    end

    it "wait after shot" do
      subject.shot
      subject.state.should == "wait"
    end

    it "raise error with two shots" do
      subject.shot
      subject.shot.should be_false
    end

    it "shot after 2 seconds" do
      subject.shot
      sleep(2)
      subject.shot.should be_true
    end

    it "saves the shot time" do
      subject.shot
      subject.last_shot_at.should_not be_nil
    end

  end
end