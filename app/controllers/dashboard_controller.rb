class DashboardController < ApplicationController
  def index
    @players = Player.all.sort { |a, b| a.wins <=> b.wins }.reverse
  end
end
