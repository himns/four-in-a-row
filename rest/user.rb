class User

  attr_accessor :name, :clan, :honor

  def initialize(args={})
    @name = args[:name]
    @clan = args.fetch(:clan, "")
    @honor = (args.fetch(:honor, 0)).to_i
  end

end