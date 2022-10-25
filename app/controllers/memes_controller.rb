class MemesController < ApplicationController

    def index
        memes = Meme.all
        render json: memes
    end
    
    def create
        meme = Meme.create(meme_params)
        if meme.valid?
            render json: meme
        else
            render json: meme.errors, status: 422
        end
    end

    def update
        meme = Meme.find(params[:id])
        meme.update(meme_params)
        if meme.valid?
            render json: meme
        else
            render json: meme.errors, status: 422
        end
    end

    def destroy
        meme = Meme.find(params[:id])
        if meme.destroy
            render json: meme
        else
            render json: meme.errors, status: 420
        end
    end

    private
    def meme_params
        params.require(:meme).permit(:title, :likes, :dislikes, :image, :description)
    end

end
