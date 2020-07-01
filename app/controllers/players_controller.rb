class PlayersController < ApplicationController

    def create
        @player = Player.create(
            name: params[:name],
            password: params[:password]
        )
        render json: {user: @player }
    end
end
