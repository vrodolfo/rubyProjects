require 'rails_helper'
RSpec.describe SecretsController, type: :controller do 
  before do 
    @user = create(:user)
    @secret = create(:secret, user: @user)
    @like = create(:like, secret: @secret, user: @user)
  end
  context "when not logged in " do 
    before do 
      session[:user_id] = nil
    end
    it "cannot create a like" do 
      get :like, secret_id: @secret.id
      expect(response).to redirect_to("/sessions/new")
    end 

    it "cannot destroy a like"  do 
      get :unlike, secret_id: @secret.id
      expect(response).to redirect_to("/sessions/new")
    end 
  end
end