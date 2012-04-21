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

    it "cannot shot two times in a row " do
      subject.shot
      subject.shot.should be_false
    end

    it "shot after 2 seconds" do
      subject.shot
      subject.time_elapsed(2)
      subject.shot.should be_true
    end

    it "shot after 10 seconds" do
      subject.shot
      subject.time_elapsed(10)
      subject.shot.should be_true
    end

    it "can not shot after 1 second" do
      subject.shot
      subject.time_elapsed(1)
      subject.shot.should be_false
    end

  end
end