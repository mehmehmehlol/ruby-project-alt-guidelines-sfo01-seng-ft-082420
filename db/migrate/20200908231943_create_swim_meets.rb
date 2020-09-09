class CreateSwimMeets < ActiveRecord::Migration[5.2]
  def change
    create_table :swim_meets do |t|
      t.integer :coach_id
      t.integer :student_id
      t.string :name
    end
  end
end
