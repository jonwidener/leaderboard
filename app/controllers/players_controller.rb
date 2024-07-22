class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    respond_to do |format|
      if @player.save
        format.html { redirect_to action: :index, notice: "#{@player.name} was successfully created." }
      else
        format.html { render action: "new" }
      end
    end
  end

private

  def player_params
    params.require(:player).permit(%i(name avatar))  
  end
end
