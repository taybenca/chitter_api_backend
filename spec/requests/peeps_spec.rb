require 'rails_helper'

RSpec.describe "Peeps", type: :request do
  describe "GET /peeps" do
    it "works! (now write some real specs)" do
      get peeps_path
      expect(response).to have_http_status(200)
    end
  end
end
