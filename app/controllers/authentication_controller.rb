class AuthenticationController < ApplicationController

    def login
        @player = Player.find_by(name: params[:name])
        if !@player
            render json: {error: "Bad Name"}, status: :unauthorized
        else
            if 
                !@player.authenticate (params[:password])
                render json: {error: "Bad Password"}, status: :unauthorized
            else
                payload = {
                    payer_id: @player.id,
                    name: @player.name,
                }
                secret = Rails.application.secrets.secret_key_base
                token = JWT.encode(payload, secret)
                render json: {token: token}
            end
        end
    end

end
