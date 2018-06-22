class SessionsController < ApplicationController
  # POST /sessions
  def create
    user = User.find_by(handle: params[:session][:handle])
    if user.authenticate(params[:session][:password])
      render json: {}, status: :created
    else
      render json: {}, status: :unprocessable_entity
    end
  end

  private
    # Only allow a trusted parameter "white list" through.
    def session_params
      params.require(:session).permit(:handle, :password)
    end
end
