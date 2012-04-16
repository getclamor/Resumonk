class AddLayoutToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :layout, :string

  end
end
