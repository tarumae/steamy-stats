require 'open-uri'
require 'json'

URL = "https://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=XXXXXXXXXXXXXXXXX&steamid=76561197960434622&format=json"

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home try_again steam_request]

  def home; end

  def try_again; end

  def steam_request
    steam_id = params[:steam_id][:steam_id]
    response = JSON.parse(open("http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=#{ENV['STEAM_API']}&steamid=#{steam_id}&include_appinfo=true&include_played_free_games=true&format=json").read)
    @statistics = Statistic.all
    @sorted_games = response["response"]["games"].sort_by { |game| game["playtime_forever"] }.reverse.first(10)
    rescue OpenURI::HTTPError => e
    if e
      flash[:notice] = "Either the ID you provided is not valid or something has gone horribly wrong. Try again."
      redirect_to root_path
    end
  end
end
