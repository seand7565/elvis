module Elvis
  module Messages
    class Source
      def self.text(user)
        "What's your favorite song from a #{thing}?"
      end

      def self.thing
        [
          "movie",
          "video game"
        ].sample
      end
    end
  end
end
