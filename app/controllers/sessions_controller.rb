class SessionsController < ApplicationController
  def create
    if user = GithubUser.from_omniauth(request.env["omniauth.auth"])
       session[:user_id] = user.id
    end
       redirect_to github_user_path(user.id)
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
