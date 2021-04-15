require 'open-uri'
require 'json'

URL = "https://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=XXXXXXXXXXXXXXXXX&steamid=76561197960434622&format=json"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :steam_call ]

  def home
  end

  def steam_call
    steam_id = params[:steam_id][:steam_id]
    response = JSON.parse(open("http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=#{ENV['STEAM_API']}&steamid=#{steam_id}&include_appinfo=true&include_played_free_games=true&format=json").read)
    parsed_response = response["response"]["games"].sort_by{ |game| game["playtime_forever"] }.reverse.first(10)
    raise
  end
end
