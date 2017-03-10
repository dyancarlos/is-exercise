require 'rails_helper'

RSpec.describe Classroom, type: :model do

  describe "create student" do
    it "should be valid"  do
      course    = FactoryGirl.build(:course)
      student   = FactoryGirl.build(:student)
      classroom = FactoryGirl.build(:classroom, student: student, course: course)

      expect(classroom).to be_valid
    end

    it "entry_at should be valid" do
      course    = FactoryGirl.create(:course)
      student   = FactoryGirl.create(:student)
      classroom = FactoryGirl.create(:classroom, student: student, course: course)

      expect(classroom.entry_at).to_not be_blank
    end
  end

end
