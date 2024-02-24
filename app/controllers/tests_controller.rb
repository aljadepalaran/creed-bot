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

  def voice_connect
    Thread.start do
      $bot.voice_connect(891_096_280_661_647_431)
    end
  end

  def voice_disconnect
    $bot.voice_destroy(351_459_276_633_669_632)
  end

  def send_message
    $bot.send_message(855_882_840_080_121_856, params[:message])
  end

  def set_status
    $bot.update_status(
      params[:status],
      params[:activity],
      params[:url]
    )
  end

  private

  def token
    @token ||= Rails.application.credentials.discord_bot_token
  end
end
# rubocop:enable Style/GlobalVars
