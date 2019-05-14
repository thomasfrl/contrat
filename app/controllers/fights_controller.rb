class FightsController < ApplicationController
  before_action :set_fight, only: [:show]

  # GET /fights
  # GET /fights.json
  def index
    @fights = Fight.all
  end

  # GET /fights/1
  # GET /fights/1.json
  def show
    @winner = @fight.winner
    @loser = @fight.loser
    @weapons_winner = @fight.weapons_winner
    @weapons_loser = @fight.weapons_loser
  end

  # GET /fights/new
  def new
    @fight = Fight.new
    @weapons = Weapon.all
  end

  # POST /fights
  # POST /fights.json
  def create
    @fight = Fight.new(fight_params)
    @fight.weapons_fighter1_ids = params[:weapon1_ids] ||[]
    @fight.weapons_fighter2_ids = params[:weapon2_ids] || []
    if @fight.save
      redirect_to @fight, notice: 'Fight was successfully created.' 
    else
      @weapons = Weapon.all
      render :new 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fight
      @fight = Fight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fight_params
      params.require(:fight).permit(:fighter_1_id, :fighter_2_id)
    end
end
