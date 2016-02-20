class CreateFighters < ActiveRecord::Migration
  def up
    create_table :fighters do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.integer :experience_points
      t.attachment :avatar

      t.timestamps
    end
  end
  
  def down
    drop_table :fighters
  end
end
