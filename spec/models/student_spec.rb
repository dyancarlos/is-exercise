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

  it "should return status" do
    expect(Student.get_status).to eq [["Ativo", 1], ["Inativo", 0]]
  end
end
