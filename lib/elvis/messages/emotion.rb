module Elvis
  module Messages
    class Emotion
      def self.text(user)
        "Let's get emotional. What's a song that makes you feel #{emotion}?"
      end

      def self.emotion
        [
          "happy",
          "sad",
          "angry",
          "excited",
          "pumped",
          "in love"
        ].sample
      end
    end
  end
end
