class FightersController < ApplicationController
  before_action :set_fighter, only: [:show, :edit, :update, :destroy]

  # GET /fighters
  # GET /fighters.json
  def index
    @fighters = Fighter.all
  end

  # GET /fighters/1
  # GET /fighters/1.json
  def show
    @won_fights = @fighter.won_fights
    @lost_fights = @fighter.lost_fights
    @fights = @fighter.fights
  end

  # GET /fighters/new
  def new
    @fighter = Fighter.new
  end

  # GET /fighters/1/edit
  def edit
  end

  # POST /fighters
  # POST /fighters.json
  def create
    @fighter = Fighter.new(fighter_params)
    if @fighter.save
      if params[:fighter][:avatar]
        @fighter.avatar.attach(params[:fighter][:avatar])
      else 
        @fighter.avatar.attach(io: File.open("app/assets/images/fighter/default.png"), filename:"default.png")
      end
      redirect_to @fighter, notice: 'Fighter was successfully created.' 
    else
      render :new 
    end
  end

  # PATCH/PUT /fighters/1
  # PATCH/PUT /fighters/1.json
  def update
    if @fighter.update(fighter_params)
      @fighter.avatar.attach(params[:fighter][:avatar]) if params[:fighter][:avatar]
      redirect_to @fighter, notice: 'Fighter was successfully updated.' 
    else
        render :edit
    end
  end

  # DELETE /fighters/1
  # DELETE /fighters/1.json
  def destroy
    @fighter.destroy
    respond_to do |format|
      format.html { redirect_to fighters_url, notice: 'Fighter was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fighter
      @fighter = Fighter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fighter_params
      params.require(:fighter).permit(:name, :life, :attack, :xp)
    end
end
