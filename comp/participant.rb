class Participant

  attr_accessor :name, :chickenwings, :hamburgers, :hotdogs, :list

  def initialize(args)
    @name = args[:name]
    @chickenwings = args.fetch(:chickenwings, 0) * 5
    @hamburgers = args.fetch(:hamburgers, 0) * 3
    @hotdogs = args.fetch(:hotdogs, 0) * 2
    @list = list
  end

  def score
    puts chickenwings
  end

end

p1 = Participant.new( 
  name: "Zorro",
  chickenwings: 5,
  hotdogs: 8
)

p2 = Participant.new( 
  name: "Annette",
  chickenwings: 5,
  hamburgers: 1,
  hotdogs: 3
)

p3 = Participant.new( 
  name: "Paul",
  hamburgers: 5,
  hotdogs: 8
)
@list = [p2, p1, p3]

print p1





 