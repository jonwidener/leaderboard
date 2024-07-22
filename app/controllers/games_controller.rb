class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    @game = Game.new(game_params)


    if @game.save
      redirect_to action: :index
    else
      render :new, alert: @game.errors
    end

    p @game.errors
  end

private

  def game_params
    game = params[:game]
    player_ids = JSON.parse(game[:players]) unless game[:players].blank?
    players = player_ids&.map { |id| Player.find(id) }
    winner = Player.find(game[:winner].to_i) unless game[:winner].blank?
    
    played_on = Date.new game["played_on(1i)"].to_i, game["played_on(2i)"].to_i, game["played_on(3i)"].to_i

    {
      played_on:,
      players:,
      winner:
  }.tap { |r| p r }    
  end
end
