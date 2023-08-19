require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns a successful response" do
      get :new
      expect(response).to be_successful
    end

    it "assigns a new user to @user" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new user" do
        user_params = {
          user: {
            name: "Test User",
            email: "test@example.com",
            password: "password123",
            password_confirmation: "password123"
          }
        }
  
        expect {
          post :create, params: user_params
        }.to change(User, :count).by(1)
  
        # Optionally, you can also check that the response is a redirect, etc.
        expect(response).to have_http_status(:redirect)
      end
    end

    context "with invalid params" do
      it "does not create a new user" do
        user_params = { user: { name: nil } }
        expect {
          post :create, params: user_params
        }.not_to change(User, :count)
      end

      it "re-renders the 'new' template" do
        user_params = { user: { name: nil } }
        post :create, params: user_params
        expect(response).to render_template("new")
      end
    end
  end
end
