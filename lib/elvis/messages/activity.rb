module Elvis
  module Messages
    class Activity
      def self.text(user)
        "What's the best song for #{activity}?"
      end

      def self.activity
        [
          "flying through space",
          "working",
          "cleaning",
          "dancing",
          "driving",
          "sailing",
          "cooking"
        ].sample
      end
    end
  end
end
