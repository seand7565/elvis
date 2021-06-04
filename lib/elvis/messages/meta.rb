module Elvis
  module Messages
    class Meta
      def self.text(user)
        "Hey, there! Let's get meta. This week, #{songs_this_week.count} tracks were added to the playlist. The most frequent contributor was #{most_frequent_contributor}. You win this: #{prize}. Keep it up!"
      end

      def self.songs_this_week
        Track.where("created_at >= ?", 1.week.ago).where(state: "posted")
      end

      def self.most_frequent_contributor
        songs_this_week.map(&:submitter).tally.sort_by{|k,v|v}.last[0]
      end

      def self.prize
        [:🏆,:🥞,:🎂,:🎖️,:✨,:💙,:💰].sample
      end
    end
  end
end
