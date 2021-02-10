module Elvis
  module Messages
    class Genres
      def self.text(user)
        "Genre time. Post your favorite #{genre} song!"
      end

      def self.genre
        [
          "metal",
          "pop",
          "rap",
          "folk",
          "R&B",
          "punk",
          "electronic",
          "rock",
          "country",
          "polka",
          "k-pop"
        ].sample
      end
    end
  end
end
