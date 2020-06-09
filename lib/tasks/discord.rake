require 'discordrb'
namespace :discord do
  # bot = Discordrb::Bot.new token: Rails.application.credentials.discord_key

  desc "TODO"
  task ping_channel: :environment do

  end

  desc "This pings a person with a given user id"
  task :ping_person, [:user_id] =>[:environment] do |t, args|

    # puts Member.find(args[:user_id]).display_name
    # # bot.run
  end

end
