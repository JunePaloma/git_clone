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
