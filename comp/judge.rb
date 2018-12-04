require_relative 'participant'

class Judge

  attr_reader :results

  def initialize
    @results = []
  end

  def display_results 
      @results.sort!{ |h1, h2| [h2[:res], h1[:name]] <=> [h1[:res], h2[:name]] }
      @results.each_with_index do |val, index| 
      puts "The results are as follows:"
      puts "#{val[:name]} has #{val[:res]} points"
    end
  end

  def centralize_score_and_name(list)
    list.each do |p|
      score = p.chickenwings + p.hamburgers + p.hotdogs
      @results << {
        name: p.name,
        res: score   
      }
     end
  end

end

c = Judge.new
c.centralize_score_and_name(@list)
puts c.display_results