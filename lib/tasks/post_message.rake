desc 'Post messages to slack'
task :post_messages => :environment do |t, args|
  user = User.find_by(email: "elvisstack@gmail.com")
  return unless user

  if Date.today < Date.new(2021,7,25)
    if [2,4].include? Date.today.wday
      received_messages = user.messages.last(20).pluck(:message_type).map(&:constantize)
      possible_messages = Elvis::Messages::Configuration.messages - received_messages

      message = user.messages.create!(message_type: possible_messages.sample)
      message.post!
    elsif Date.today.wday == 5
      message = user.messages.create!(message_type: ::Elvis::Messages::Meta)
      message.post!
    end
  end
end
