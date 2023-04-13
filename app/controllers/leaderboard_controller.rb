class LeaderboardController < ApplicationController
  def index
    rank = 1
    prev_score = 0
    @players = Player.all.order(win_count: 'desc').map do |player|
      if player.win_count < prev_score
        rank += 1
      end
      prev_score = player.win_count
      {
        id: player.id,
        name: player.name,
        win_count: player.win_count,
        rank:
      }
    end
    @players.each do |player|
    end
  end

  def add_win_to_player
    @player = Player.find params[:id]
    @player.win_count += 1
    @player.save

    redirect_to root_path
  end

  def rank player

  end
end
