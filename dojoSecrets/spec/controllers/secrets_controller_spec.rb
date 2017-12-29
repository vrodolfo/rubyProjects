require 'rails_helper'
RSpec.describe SecretsController, type: :controller do
  before do
    @user = create(:user)
    @secret = create(:secret, user: @user)

    @user2 = User.create(name:"name" , email: "test2@test.com", password:"password")
    @secret2 = create(:secret, user: @user2)

  end
  context "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access index" do
      get :index
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access create" do
      get :create, user_id: @user.id
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access destroy" do
      get :destroy, user_id: @user.id, secret_id: @secret.id
      expect(response).to redirect_to("/sessions/new")
    end
  end

  context "when signed in as the wrong user" do
    it "cannot destroy another user's secret" do 
     session[:user_id] = @user.id
     delete :destroy, user_id: @user.id, secret_id: @secret2.id
     #expect(response).to be_success
     expect(response).to redirect_to("/users/#{@user.id}/edit")
     
    end
  end

  context "when signed in as the wrong user" do
    it "shouldn't be able to destroy a like" do
      session[:user_id] = @user.id
      post :unlike, user_id: @user2.id, secret_id: @secret2.id
      #expect(response).to be_success
      expect(response).to redirect_to("/users/#{@user.id}/edit")
    end
  end 
end