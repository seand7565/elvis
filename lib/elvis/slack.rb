module Elvis
  class Slack
    WEBHOOK = ENV["webhook_url"]

    def post(message)
      ::HTTParty.post(
        "#{WEBHOOK}",
        body: {"text":"#{message}"}.to_json
      )
    end

    def get_user_name(user_id)
      identity_url = "https://slack.com/api/users.info?token=#{ENV["slack_token"]}&user=#{user_id}"

      request = ::HTTParty.get(identity_url)

      parsed_user = JSON.parse(request.body)["user"]
      parsed_user["real_name"] || parsed_user["name"]
    end
  end
end
