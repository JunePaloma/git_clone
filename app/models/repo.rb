class Repo
  def initialize(name, language, created_at)
  @name = name
  @language = language
  @created_at = created_at
  end
  private
  attr_reader :name, :language, :created_at
end
