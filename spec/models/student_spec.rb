require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should have_many(:classrooms) }

  describe "create student" do
    it "should be valid" do
      student = FactoryGirl.build(:student)
      expect(student).to be_valid
    end

    it "should not be valid without name" do
      student = FactoryGirl.build(:student, name: "")
      expect(student).to_not be_valid
    end

    it "should not be valid without register number" do
      student = FactoryGirl.build(:student, register_number: "")
      expect(student).to_not be_valid
    end

    it "should not be valid without informations" do
      student = FactoryGirl.build(:student, name: "", register_number: "")
      expect(student).to_not be_valid
    end
  end

  it "should returns all students to be selected on classroom" do
    student_one = FactoryGirl.create(:student, name: "Joao Paulo")
    student_two = FactoryGirl.create(:student)

    expect(Student.get_students).to eq [[student_one.name, student_one.id], [student_two.name, student_two.id]]
  end

  it "status should be active" do
    student = FactoryGirl.create(:student, status: 1)
    expect(Status.t(student.status)).to eq "Ativo"
  end

  it "status should be inative" do
    student = FactoryGirl.create(:student, status: 0)
    expect(Status.t(student.status)).to eq "Inativo"
  end
end
