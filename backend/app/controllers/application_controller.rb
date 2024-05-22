class ApplicationController < ActionController::API
  include JsonWebToken

  def current_user
    header = request.headers["Authorization"]

    if header
      token = header.split(" ").last
      decoded = jwt_decode(token)
      User.find(decoded[:user_id])
    else
      User.new
    end
  end
end
