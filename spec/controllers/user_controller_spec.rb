require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe 'GET #show' do
    user = create(:user)
    get :show, id: user
    expect(assigns(:article)).to eq 
  end

end
