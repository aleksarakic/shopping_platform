require 'rails_helper'

RSpec.describe "Suppliers", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/suppliers/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/suppliers/create"
      expect(response).to have_http_status(:success)
    end
  end

end
