class GithubService
  def initialize(current_user)
    @current_user = current_user
    @conn = Faraday.new(url: 'https://api.github.com') do |faraday|
      faraday.params["access_token"] = "#{current_user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end
  end

  def fetch_repos
    repo_info = @conn.get("/users/#{@current_user.user_name}/repos?per_page=100")
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

  def fetch_following
    follower_info = @conn.get("/users/#{@current_user.user_name}/following")
      results = JSON.parse(follower_info.body, symbolize_names: true )
      following = results.map do |following|
      User.new(following[:login], following[:url], following[:id], following[:avatar_url])
    end
    following
  end

  def fetch_starred
    follower_info = @conn.get("/users/#{@current_user.user_name}/starred")
      results = JSON.parse(follower_info.body, symbolize_names: true)
      starred = results.map do |star|
      Starred.new(star[:name], star[:full_name])
    end
    starred
  end
end
