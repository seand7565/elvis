module Elvis
  module Messages
    class Regions
      def self.text(user)
        "Go global! What's your favorite song from #{region}?"
      end

      def self.region
        [
          "South America",
          "North America",
          "Central America",
          "Asia",
          "Africa",
          "The Caribbean",
          "Europe",
          "Oceania"
        ].sample
      end
    end
  end
end
