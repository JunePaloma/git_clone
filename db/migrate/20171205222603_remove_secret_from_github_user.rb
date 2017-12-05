class RemoveSecretFromGithubUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :github_users, :oauth_secret, :string
  end
end
