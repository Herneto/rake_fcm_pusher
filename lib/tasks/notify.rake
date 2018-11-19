require 'fcm_pusher'

namespace :experiment do
    desc "Send notification to User: amarildo"
    task :send => :environment do
        pusher = FcmPusher.new(ENV["FCM_API_KEY"])
        if((user = User.where("username = 'amarildo'")).exists?)
            pusher.send_once(user.fcm_token, "Please pay attention", "This notification come to you through Firebase Cloud Message using fcm_pusher gem.")
        end
    end
end