class StatController < ApplicationController

    def index
        headers = request.headers
        authorization_header = headers["Authorization"]
        
        if !authorization_header
            render json: {error: "Nice try, Buddy"}, status: :unauthorized
        else
        token = authorization_header.split(" ")[1]
        secret = Rails.application.secrets.secret_key_base
        payload = JWT.decode(token, secret).first
        render json: {message: "You're a slugger, #{payload['name']}!"}
        end
    end

end
