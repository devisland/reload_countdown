require "spec_helper"

describe Gun do
  context "a gun with wait_time of 2 seconds" do
    subject{Gun.new(2)}
    its(:wait_time){should be(2)}
    it "starts ready" do
      subject.should be_ready
    end

    it "shot" do
      subject.shot.should be_true
    end

    it "after shot" do
      subject.shot
      subject.should be_reloading
    end

    it "raise error with two shots" do
      subject.shot
      subject.shot.should be_false
    end

    it "shot after 2 seconds" do
      subject.shot
      subject.timeElapsed(2)
      subject.shot.should be_true
    end

  end
end