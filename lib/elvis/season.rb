module Elvis
  module Season
    def season
      case self.month
        when 3, 4, 5
          'Spring'
        when 6, 7, 8
          'Summer'
        when 9, 10, 11
          'Fall'
        when 12, 1, 2
          'Winter'
      end
    end
  end
end

class Time
  include Elvis::Season
end
class Date
  include Elvis::Season
end
class DateTime
  include Elvis::Season
end
