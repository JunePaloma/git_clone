class CreateGithubUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :github_users do |t|
      t.string :user_name
      t.string :uid
      t.string :oauth_token
      t.string :oauth_secret

      t.timestamps
    end
  end
end
