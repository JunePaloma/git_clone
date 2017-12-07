class GithubUsersController < ApplicationController
  def show
    @conn =  Faraday.new(url: 'https://api.github.com') do |faraday|
      faraday.params["access_token"] = "#{current_user.oauth_token}"
      faraday.adapter Faraday.default_adapter
    end
  user_info = @conn.get("/users/#{@current_user.user_name}/repos")
    results = JSON.parse(user_info.body, symbolize_names: true )
    @repositories = results.map do |repo|
    Repo.new(repo[:name], repo[:language])
    end
  end
end

# class RepoOfRepos
#   def initialize(repo_data)
#     @data = repo_data
#   end
#
# def make_individual_repos
#   @data.map do |repo|
#     SingleRepo.new(repo[:name], repo[:langage])
#     end
#   end
# end

class Repo
  def initialize(name, language)
  @name = name
  @language = language
  end
  private
  attr_reader :name, :language
end
