require 'minitest/autorun'
#
class Five
  def counter
    five =  "sanda".size
  end
end

describe Five do

  describe '#counter' do

    before do
      @five = Five.new
    end

    it 'should always return value 5' do
      @five.counter.must_equal 5
    end
  end

end

