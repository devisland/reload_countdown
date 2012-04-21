require "spec_helper"

describe Gun do
  context "a gun with wait_time of 2 seconds" do
    let(:gun){Gun.new(2)}
    subject{gun}

    its(:wait_time){should be(2)}

    it do
      should be_ready
    end

    it "can shot" do
      gun.shot.should be_true
    end

    context "after shot" do
      before do
        gun.shot
      end

      it do
        gun.should be_reloading
      end

      it "cannot shot two times in a row " do
        gun.shot.should be_false
      end

      it "shot after 2 seconds" do
        gun.time_elapsed(2)
        gun.shot.should be_true
      end

      it "shot after 10 seconds" do
        gun.time_elapsed(10)
        gun.shot.should be_true
      end

      it "can not shot after 1 second" do
        gun.time_elapsed(1)
        gun.shot.should be_false
      end
    end
  end
end