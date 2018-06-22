class PeepsController < ApplicationController
  before_action :set_peep, only: [:show, :update, :destroy]

  # GET /peeps
  def index
    @peeps = Peep.all

    render json: @peeps
  end

  # GET /peeps/1
  def show
    render json: @peep
  end

  # POST /peeps
  def create
    @peep = Peep.new(peep_params)

    if @peep.save
      render json: @peep, status: :created, location: @peep
    else
      render json: @peep.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /peeps/1
  def update
    if @peep.update(peep_params)
      render json: @peep
    else
      render json: @peep.errors, status: :unprocessable_entity
    end
  end

  # DELETE /peeps/1
  def destroy
    @peep.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peep
      @peep = Peep.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def peep_params
      params.require(:peep).permit(:user_id, :body)
    end
end
