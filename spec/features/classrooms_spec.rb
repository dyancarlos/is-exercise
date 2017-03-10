require 'rails_helper'

RSpec.describe "Classrooms Feature", type: :feature do

  context "with dependencies" do
    it "without course and student should redirect to new course" do
      visit new_classroom_path
      expect(page).to have_content "Novo Curso"
    end

    it "without course should redirect to new course" do
      FactoryGirl.create(:student)

      visit new_classroom_path
      expect(page).to have_content "Novo Curso"
    end

    it "without student should redirect to new student" do
      FactoryGirl.create(:course)

      visit new_classroom_path
      expect(page).to have_content "Novo Estudante"
    end
  end

  context "without dependencies" do
    it "create a valid classroom" do
      course  = FactoryGirl.create(:course)
      student = FactoryGirl.create(:student)

      visit new_classroom_path
      select student.name, from: "Estudante"
      select course.name, from: "Curso"
      click_button "Salvar"

      expect(page).to have_content "Classe foi criado com sucesso"
    end
  end

end
