class Student < ActiveRecord::Base
  has_many :classrooms

  validates :name, :register_number, :status, presence: true
  validates :name, :register_number, length: { maximum: 45 }

  def self.get_status
    [["Ativo", Status::ACTIVE], ["Inativo", Status::INATIVE]]
  end
end
