class User
  def initialize(login, url, uid, avatar_url)
    @login = login
    @url = url
    @uid = uid
    @avatar_url = avatar_url
  end

  private
  attr_reader :login, :url, :id, :avatar_url
end
