class AddShortLinkToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :short_link, :string

  end
end
