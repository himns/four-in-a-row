require 'minitest/autorun'

class SelfCheckOut

  attr_reader :person_all, :till

  def initialize(person_all, till)

    @person_all = person_all
    @till = till

  end

  def calc_checkout_time
    people_at_tills = @person_all.slice!(0..@till - 1)
    # @person_all[0..@till - 1].each { |x| people_at_tills << x}
    # @person_all.slice!(0..@till - 1)

    @person_all.each do |person|
      people_at_tills.sort!
      people_at_tills[0] += person
    end
    puts "the total time required for all the customers to check out is #{people_at_tills.max} minutes"
    people_at_tills.max.nil? ? 0 : people_at_tills.max
    # if people_at_tills.max.nil?
    #   0
    # else
    #   people_at_tills.max
    # end
  end

end

# queue = SelfCheckOut.new([2,2,3,3,4,4], 2)
# queue.calc_checkout_time

describe SelfCheckOut do

  before do
    @queue = SelfCheckOut.new([2,2,3,3,4,4], 2)
  end
  
  it "sould have requires attributes" do
    @queue.respond_to?(:person_all).must_equal true
    @queue.respond_to?(:till).must_equal true
    expect(@queue.person_all).must_be_kind_of(Array) 
  end

  describe '#calc_checkout_time' do
  before do
    @queue = SelfCheckOut.new([], 1)
  end
    it 'sould always return a positive value' do
      @queue.calc_checkout_time.must_equal 0
    end
  end

  describe '#calc_checkout_time' do
  before do
    @queue = SelfCheckOut.new([5], 1)
  end
    it 'sould always return a positive value' do
      @queue.calc_checkout_time.must_equal 5
    end
  end

  describe '#calc_checkout_time' do
  before do
    @queue = SelfCheckOut.new([2], 5)
  end

    it 'sould always return a positive value' do
      @queue.calc_checkout_time.must_equal 2
    end
  end

  describe '#calc_checkout_time' do
  before do
    @queue = SelfCheckOut.new([1,2,3,4,5], 1)
  end
    it 'sould always return a positive value' do
      @queue.calc_checkout_time.must_equal 15
    end
  end

  describe '#calc_checkout_time' do
  before do
    @queue = SelfCheckOut.new([1,2,3,4,5], 100)
  end
    it 'sould always return a positive value' do
      @queue.calc_checkout_time.must_equal 5
    end
  end

  describe '#calc_checkout_time' do
  before do
    @queue = SelfCheckOut.new([2,2,3,3,4,4], 2)
  end
    it 'sould always return a positive value' do
      @queue.calc_checkout_time.must_equal 9
    end
  end



end