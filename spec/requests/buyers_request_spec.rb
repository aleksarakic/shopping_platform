require 'rails_helper'

RSpec.describe "Buyers", type: :request do

  attributes = {name: 'TESTUSER', type: 'Buyer', description: 'Desxc', address: 'Address'}

  describe "POST /create" do
    subject { post '/buyers/create/', params: {:buyer => attributes} }
    
    it 'creates a buyer' do
      expect{subject}.to change { Buyer.count }.by(1)
    end

    it 'is redirected to log in path after success' do
      expect(subject).to redirect_to '/log_in'
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/buyers/new"
      expect(response).to have_http_status(:success)
    end
  end
end
