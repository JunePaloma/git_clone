class GithubUsersController < ApplicationController
  def show
    @repositories = GithubService.new(current_user).fetch_repos
    @followers = GithubService.new(current_user).fetch_followers
    @following = GithubService.new(current_user).fetch_following
  end
end
