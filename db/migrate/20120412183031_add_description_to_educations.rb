class AddDescriptionToEducations < ActiveRecord::Migration
  def change
    add_column :educations, :description, :text

  end
end
