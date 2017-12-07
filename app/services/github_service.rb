class GithubService
  def initialize(current_user)
    @current_user = current_user
    @conn = Faraday.new(url: 'https://api.github.com') do |faraday|
      faraday.params["access_token"] = "#{current_user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_repos
    repo_info = @conn.get("/users/#{@current_user.user_name}/repos")
      results = JSON.parse(repo_info.body, symbolize_names: true )
      repos = results.map do |repo|
      Repo.new(repo[:name], repo[:language], repo[:created_at])
    end
     repos
  end

  def fetch_followers
    follower_info = @conn.get("/users/#{@current_user.user_name}/followers")
      results = JSON.parse(follower_info.body, symbolize_names: true )
      followers = results.map do |follower|
      User.new(follower[:login], follower[:url], follower[:id], follower[:avatar_url])
    end
    followers
  end
end

class User
  def initialize(login, url, id, avatar_url)
    @login = login
    @url = url
    @id = id
    @avatar_url = avatar_url
  end

  private
  attr_reader :login, :url, :id, :avatar_url
end
