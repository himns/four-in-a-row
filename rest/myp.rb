require 'time'
require 'byebug'

class SafeDriver
    attr_accessor :beverages, :finished, :drive_hour
    def initialize(beverages, finished, drive_hour)
        @beverages = beverages
        @finished = finished
        @drive_hour = drive_hour
    end

    def is_sober? 
        parse_time > calc_total ? true : false
    end

    def parse_time
        drive_hour > finished ? time_diff : (24 + time_diff).abs
    end

    def calc_total
       beverages.map { |n| ((n[0] * n[1]) / 1000) }.reduce(:+).round(2)
    end

    private

    def time_diff
        time_diff = ((Time.parse(drive_hour) - Time.parse(finished)) / 3600).round
    end

end
test = SafeDriver.new([[5.2,568],[5.2,568],[5.2,568],[12.0,175],[12.0,175],[12.0,175]], "11:59", "13:00")
test.is_sober?

