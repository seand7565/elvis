module Elvis
  module Messages
    class GrowingUp
      def self.text(user)
        "Let's go back. What's a song or album that defined your #{span}?"
      end

      def self.span
        [
          "childhood years",
          "teenage years",
          "early 20s"
        ].sample
      end
    end
  end
end
