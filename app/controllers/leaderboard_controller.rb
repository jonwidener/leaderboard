class LeaderboardController < ApplicationController
  def index
    rank = 1
    prev_score = 0
    @players = Player.all.order(score: 'desc').map do |player|
      if player.score < prev_score
        rank += 1
      end
      prev_score = player.score
      {
        id: player.id,
        name: player.name,
        score: player.score,
        rank:
      }
    end
    @players.each do |player|
    end
  end

  def add_win_to_player
    @player = Player.find params[:id]
    @player.score += 1
    @player.save

    redirect_to root_path
  end

  def rank player

  end
end
