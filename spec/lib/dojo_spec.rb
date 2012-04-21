require "spec_helper"

describe Gun do
  context "a gun with wait_time of 2 seconds" do
    subject{Gun.new(2)}
    its(:wait_time){should be(2)}
    it "starts stopped" do
      subject.stopped.should be_true
    end

    it "shot" do
      subject.shot.should be_true
    end

    it "wait after shot" do
      subject.shot
      subject.state.should == "wait"
    end
  end
end