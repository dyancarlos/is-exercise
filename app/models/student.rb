class Student < ActiveRecord::Base
  has_many :classrooms

  validates :name, :register_number, :status, presence: true
end
