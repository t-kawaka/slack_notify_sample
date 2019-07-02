require "slack-notify"
require 'clockwork'
require 'active_support/time'
require 'dotenv'
include Clockwork

Dotenv.load

# ruby samle.rbを入力すると通知メッセージがslackに届く
client = SlackNotify::Client.new(
  webhook_url: ENV['URL'],
  channel: "#general",
  username: "川上のbot message",
  icon_url: "http://mydomain.com/myimage.png",
  icon_emoji: ":shipit:",
  link_names: 1
)

client.notify("通知メッセージ")

# 3分毎の通知メッセージがslackに届く
module Clockwork
client = SlackNotify::Client.new(
  webhook_url: ENV['URL'],
  channel: "#general",
  username: "川上のbot message(3分ごと)",
  icon_url: "http://mydomain.com/myimage.png",
  icon_emoji: ":shipit:",
  link_names: 1
)
  every(3.minutes, "three_minutes") do
    client.notify("定期メッセージ")
  end
end
