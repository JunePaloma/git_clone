class UserRepoPresenter
  def initialize(current_user)
    @current_user = current_user
  end

  def retrieve_user_repos
    github_service.fetch_repos
  end

  def dislay_titleized_repo_name(repo_name)
    repo_name.titleize
  end

  def display_formatted_date(repo)
    formatted_date = DateTime.parse(repo.updated_at)
    formatted_date.striftime("Last updated at %m/%d/%Y")
  end

  def display_repo_count
    github_service.fetch_repos.count
  end

  private

  attr_reader :current_user

  def github_service
    @github_service ||= GithubService.new(current_user)
  end
end
