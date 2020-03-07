require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /log_in" do
    it "returns http success" do
      get "/log_in"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /log_out" do
    it "gets redirected after log out" do
      get "/log_out"
      expect(response).to have_http_status(302)
    end
  end

end
