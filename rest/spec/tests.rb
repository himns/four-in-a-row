require 'rspec/autorun'
require '../myp'

describe SafeDriver do

  let(:driver) {SafeDriver.new([[5 ,400]], "21:00", "22:00")}

  it 'calculates hours' do
    expect(driver.parse_time).to eq(1)
  end

  it 'calculates the total units' do
    expect(driver.calc_total).to eq(2)
  end

  it 'return true if the driver is sober' do
    expect(driver.is_sober?).to be(false)
  end

end

