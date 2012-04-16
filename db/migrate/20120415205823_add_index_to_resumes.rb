class AddIndexToResumes < ActiveRecord::Migration
  def change
    add_index(:resumes, :short_link)
  end
end
