class GithubUsersController < ApplicationController
  def show
  @user_repo_presenter = UserRepoPresenter.new(current_user)

    @repositories = GithubService.new(current_user).fetch_repos
    @followers = GithubService.new(current_user).fetch_followers
    @following = GithubService.new(current_user).fetch_following
    @starred = GithubService.new(current_user).fetch_starred
  end
end
