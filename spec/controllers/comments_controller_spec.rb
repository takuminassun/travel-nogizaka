require 'rails_helper'

describe CommentsController do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "assigns the requested comment to @comment" do
      comment = create(:comment)
      get :edit, params: { id: comment }
      expect(assigns(:comment)).to eq comment
    end

    it "renders the :edit template" do
      comment = create(:comment)
      get :edit, params: { id: comment }
      expect(response).to render_template :edit
    end

  end

end