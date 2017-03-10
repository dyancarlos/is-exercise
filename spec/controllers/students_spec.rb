require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  describe "GET index" do
    it "assigns @courses" do
      student = FactoryGirl.create(:student)
      get :index
      expect(assigns(:students)).to eq([student])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST create" do
    it "create a new students" do
      expect {
        post :create, student: FactoryGirl.attributes_for(:student)
      }.to change(Student, :count).by(1)
    end

    it "redirects to the index" do
      post :create, student: FactoryGirl.attributes_for(:student)
      expect redirect_to :students
    end
  end

  context "with invalid attributes" do
    it "not save the new students" do
      expect {
        post :create, student: FactoryGirl.attributes_for(:student, name: "")
      }.to_not change(Student, :count)
    end

    it "renders to the new method" do
      post :create, student: FactoryGirl.attributes_for(:student, name: "")
      expect render_template :new
    end
  end
end
