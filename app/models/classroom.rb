class Classroom < ActiveRecord::Base
  before_save :set_entry_at

  belongs_to :student
  belongs_to :course

  private
  def set_entry_at
    self.entry_at = Time.now
  end
end
