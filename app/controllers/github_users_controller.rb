class GithubUsersController < ApplicationController
  def show
    @conn =  Faraday.new(url: 'https://api.github.com') do |faraday|
      faraday.params["access_token"] = "#{current_user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end
  user_info = @conn.get("/users/#{@current_user.user_name}")
    JSON.parse(user_info.body, symbolize_names: true )
  end

end
