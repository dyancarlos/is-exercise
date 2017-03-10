require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  describe "GET index" do
    it "assigns @courses" do
      course = FactoryGirl.create(:course)
      get :index
      expect(assigns(:courses)).to eq([course])
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
    it "create a new course" do
      expect {
        post :create, course: FactoryGirl.attributes_for(:course)
      }.to change(Course, :count).by(1)
    end

    it "redirects to the index" do
      post :create, course: FactoryGirl.attributes_for(:course)
      expect redirect_to :courses
    end
  end

  context "with invalid attributes" do
    it "not save the new course" do
      expect {
        post :create, course: FactoryGirl.attributes_for(:course, name: "")
      }.to_not change(Course, :count)
    end

    it "renders to the new method" do
      post :create, course: FactoryGirl.attributes_for(:course, name: "")
      expect render_template :new
    end
  end
end
