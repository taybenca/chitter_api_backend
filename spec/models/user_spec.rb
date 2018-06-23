require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.create!(handle: "Kay", password: "rockhudson") }
  it { is_expected.to be }

  describe "#authenticate" do
    context "with valid details" do
      it "authenticates" do
        expect(user.authenticate("rockhudson")).to be_truthy
      end
    end

    context "with invalid details" do
      it "does not authenticate" do
        expect(user.authenticate("rockhudson")).to be_truthy
      end
    end
  end

  describe "#generate_session_key!" do
    it "saves & returns a session key" do
      key = user.generate_session_key!
      user.reload
      expect(user.session_key).to eq key
    end
  end
end
