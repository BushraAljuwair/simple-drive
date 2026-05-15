class ApplicationController < ActionController::API
  before_action :authenticate!


  private

  def authenticate!
    auth_header = request.headers["Authorization"]

    unless auth_header == "Bearer my-secret-token"
      render json: {
        error: "Unauthorized"
      }, status: :unauthorized
    end
  end
end
