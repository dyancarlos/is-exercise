require 'rails_helper'

RSpec.describe Course, type: :model do
  it { should have_many(:classrooms) }

  describe "create course" do
    it "should be valid" do
      course = FactoryGirl.build(:course)
      expect(course).to be_valid
    end

    it "should not be valid without name" do
      course = FactoryGirl.build(:course, name: "")
      expect(course).to_not be_valid
    end

    it "should not be valid without description" do
      course = FactoryGirl.build(:course, description: "")
      expect(course).to_not be_valid
    end

    it "should not be valid without informations" do
      course = FactoryGirl.build(:course, name: "", description: "")
      expect(course).to_not be_valid
    end
  end

  it "should return status" do
    expect(Course.get_status).to eq [["Ativo", 1], ["Inativo", 0]]
  end
end
