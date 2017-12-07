class Starred
  def initialize(name, full_name)
    @name = name
    @full_name = full_name
  end
  private
  attr_reader :name, :full_name
end
