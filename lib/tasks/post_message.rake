desc 'Post messages to slack'
task :post_messages => :environment do |t, args|
  if [1,3,5].include? Date.today.wday
    user = User.find_by(email: "elvisstack@gmail.com")
    return unless user

    received_messages = user.messages.last(8).pluck(:message_type)
    possible_messages = Elvis::Messages::Configuration.messages - received_messages

    message = user.messages.create!(message_type: possible_messages.sample)
    message.post!
  end
end
