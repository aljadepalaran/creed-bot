# frozen_string_literal: true

# rubocop:disable Style/GlobalVars
class TestsController < ApplicationController
  def index
    # render test/index
  end

  def start
    bot = Discordrb::Bot.new(token: token)
    $bot = bot
    bot.run(background: true)
  end

  def stop
    $bot.stop
  end

  private

  def token
    @token ||= Rails.application.credentials.discord_bot_token
  end
end
# rubocop:enable Style/GlobalVars
