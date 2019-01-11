require_relative 'participant'

class Judge

  attr_reader :participants  

  def initialize(*participants)
    @participants = participants
  end

  def add_participant(participant)
    @participants.push(participant)
  end

  def create_leaderbord
    @results = @participants.sort do |p1, p2| 
      [p2.score, p1.name] <=> [p1.score, p2.name]
    end
  end
  
  def display_results 
    @results.each_with_index do |participant, index| 
      puts "The results are as follows:"
      puts "#{participant.name} has #{participant.score} points"
    end
  end

  def process_game
    create_leaderbord
    display_results
  end

end

c = Judge.new(
  Participant.new(
    name: "Zorro",
    chickenwings: 5,
    hotdogs: 8
  ),
  Participant.new( 
    name: "Annette",
    chickenwings: 5,
    hamburgers: 1,
    hotdogs: 3
  ),
  Participant.new( 
    name: "Paul",
    hamburgers: 5,
    hotdogs: 8
  )
)

c.add_participant(Participant.new(name: 'Batman', chickenwings: 2, hamburgers: 3, hotdogs: 1))
c.process_game