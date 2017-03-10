class Classroom < ActiveRecord::Base
  before_save :set_entry_at

  belongs_to :student
  belongs_to :course

  validates :student, :course, presence: true

  private
  def set_entry_at
    self.entry_at = Time.now
  end
end
