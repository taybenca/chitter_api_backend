class LikesController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_like, only: [:show, :update, :destroy]
  before_action :authorize_create, only: [:create]
  before_action :authorize_modify, only: [:destroy]

  # GET /likes
  def index
    @likes = Like.all

    render json: @likes
  end

  # GET /likes/1
  def show
    render json: @like
  end

  # POST /likes
  def create
    @like = Like.new(like_params)

    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def like_params
      params.require(:like).permit(:user_id, :peep_id)
    end

    def authorize_create
      authenticate_or_request_with_http_token do |token, options|
        next false if like_params[:user_id].blank?
        user = User.find(like_params[:user_id])
        next false if user.session_key.blank?
        ActiveSupport::SecurityUtils.secure_compare(token, user.session_key)
      end
    end

    def authorize_modify
      authenticate_or_request_with_http_token do |token, options|
        set_like
        next false if @like.user.session_key.blank?
        ActiveSupport::SecurityUtils.secure_compare(token, @like.user.session_key)
      end
    end
end
