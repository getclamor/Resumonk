class ChangeDateFormats < ActiveRecord::Migration
  def change
    change_column :educations, :start_date, :string
    change_column :educations, :end_date, :string
    
    change_column :experiences, :start_date, :string
    change_column :experiences, :end_date, :string
  end

end
