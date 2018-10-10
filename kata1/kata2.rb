require 'minitest/autorun'

class BusStation

  attr_reader :arr

  def initialize arr
    @arr = arr
  end


  def count_people_remaining 
    people_by_station = 0
    people_end = 0
    @arr.each_index do |subarray|
      puts "You arrived at bus station #{subarray + 1}"
      people_by_station = @arr[subarray][0] - @arr[subarray][1]
      people_end += people_by_station
    end
    if people_end < 0
      puts "you did not provide correct data, people in the bus after the last stop cannot be #{people_end}"
      people_end
    else
      puts "There are #{people_end} people left in the bus, get them out"
      people_end
    end

  end
 
end
 
# obj = BusStation.new([[10, 2], [5, 6]])  
# obj.count_people_remaining


describe BusStation do
  
    before do
      @station = BusStation.new ([[10, 0], [3, 5], [5, 5]])
    end

  describe '#count_people_remaining?' do
    it 'should always return a value that is greater or equal to zero' do
      expect(@station.count_people_remaining).must_equal 12
    end
    it 'should always return a value that is greater or equal to zero' do
      assert_operator @station.count_people_remaining, :>=,  0
    end
  end

end