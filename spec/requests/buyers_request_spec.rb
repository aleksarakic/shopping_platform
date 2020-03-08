require 'rails_helper'

RSpec.describe "Buyers", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/buyers/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/buyers/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/buyers/show"
      expect(response).to have_http_status(:success)
    end
  end

end
