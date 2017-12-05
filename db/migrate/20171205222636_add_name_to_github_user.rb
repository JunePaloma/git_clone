class AddNameToGithubUser < ActiveRecord::Migration[5.1]
  def change
    add_column :github_users, :name, :string
  end
end
