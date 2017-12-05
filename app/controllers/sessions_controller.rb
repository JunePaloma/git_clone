class SessionsController < ApplicationController
  def create
    if user = GithubUser.from_omniauth(request.env["omniauth.auth"])
       session[:github_user_id] = github_user.id
    end
       redirect_to root_path
  end
end
