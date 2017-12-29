require 'rails_helper'
RSpec.describe UsersController, type: :controller do
  before do
    @user = create(:user)
  end
  context "when not logged in" do
    before do
      session[:user_id] = nil
    end
    it "cannot access show" do 
      get :show, user_id: @user.id
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access edit" do 
      get :edit, user_id: @user.id
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access update" do
      get :show, user_id: @user.id
      expect(response).to redirect_to("/sessions/new")
    end
    it "cannot access destroy" do
      get :destroy, user_id: @user.id
      expect(response).to redirect_to("/sessions/new")
    end
  end
end