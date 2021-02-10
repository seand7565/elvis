class Message < ApplicationRecord
  belongs_to :user, inverse_of: :messages

  state_machine initial: :pending do
    event :post do
      transition pending: :posted
    end

    before_transition to: :posted, do: :push_to_slack
  end

  def push_to_slack
    Elvis::Slack.new.post(message_type.constantize.text(user))
  end
end
