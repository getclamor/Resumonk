class CreateResumes < ActiveRecord::Migration
  def change
    create_table :resumes do |t|
      t.integer :user_id
      t.string :firstname
      t.string :lastname
      t.text :address
      t.string :phone
      t.string :website
      t.text :objective

      t.timestamps
    end
  end
end
