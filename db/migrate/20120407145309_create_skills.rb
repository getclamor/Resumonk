class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :resume_id
      t.string :skill
      t.text :description

      t.timestamps
    end
  end
end
