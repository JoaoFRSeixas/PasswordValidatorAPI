require 'rails_helper'

RSpec.describe "Welcome", type: :request do
  describe "GET /welcome/index" do
    it "returns http success" do
      get "/welcome/index"
      expect(response).to have_http_status(:success)
      expect(response.body).to eq("Validador de senhas!")
    end
  end
end