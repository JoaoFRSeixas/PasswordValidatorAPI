require 'rails_helper'

RSpec.describe "PasswordValidations", type: :request do
  describe "POST /api/v1/validate_password" do

    context "When the password is not valid" do
      invalid_passwords = [
        "",
        "aa",
        "ab",
        "AAAbbbCc",
        "AbTp9!foo",
        "AbTp9!foA",
        "AbTp9 fok"
    ]

      invalid_passwords.each do |password|
        it "return false to password: #{password}" do
          post "/api/v1/validate_password", params: { password: password }
          expect(response).to have_http_status(:ok)
          expect(JSON.parse(response.body)['valid']).to eq(false)
        end
      end
    end

    context "When the password is valid" do
      it "return status 200 and valid:true" do
        
        valid_password = 'AbTp9!fok'
        post "/api/v1/validate_password", params: { password: valid_password }

        expect(response).to have_http_status(:ok)

        expect(JSON.parse(response.body)['valid']).to eq(true)
      end
    end
  end
end
