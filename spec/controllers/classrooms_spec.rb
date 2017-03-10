require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do

  describe "GET index" do
    it "assigns @courses" do
      course = FactoryGirl.create(:course)
      student = FactoryGirl.create(:student)
      classroom = FactoryGirl.create(:classroom, student: student, course: course)
      get :index
      expect(assigns(:classrooms)).to eq([classroom])
    end

    it "renders the index template" do
      course = FactoryGirl.create(:course)
      student = FactoryGirl.create(:student)
      classroom = FactoryGirl.create(:classroom, student: student, course: course)

      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET new" do
    it "renders the new template" do
      course = FactoryGirl.create(:course)
      student = FactoryGirl.create(:student)
      classroom = FactoryGirl.create(:classroom, student: student, course: course)

      get :new
      expect(response).to render_template("new")
    end
  end

  context "with invalid attributes" do
    it "not save the new classroom" do
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
