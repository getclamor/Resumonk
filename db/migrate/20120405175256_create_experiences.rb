class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :company_name
      t.string :designation
      t.text :job_description
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :current
      t.integer :resume_id

      t.timestamps
    end
  end
end
