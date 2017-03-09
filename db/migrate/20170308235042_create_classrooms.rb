class CreateClassrooms < ActiveRecord::Migration
  def change
    create_table :classrooms do |t|
      t.references :student
      t.references :course
      t.datetime :entry_at
      t.timestamps null: false
    end
  end
end
