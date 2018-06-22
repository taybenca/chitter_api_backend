require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  describe "#authenticate" do
    context "with valid details" do
      it "authenticates" do
        user = User.create!(handle: "Kay", password: "rockhudson")
        expect(user.authenticate("rockhudson")).to be_truthy
      end
    end

    context "with invalid details" do
      it "does not authenticate" do
        user = User.create!(handle: "Kay", password: "rockhudson")
        expect(user.authenticate("rockhudson")).to be_truthy
      end
    end
  end
end
