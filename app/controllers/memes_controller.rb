class MemesController < ApplicationController

    def index
        memes = Meme.all
        render json: memes
    end
    
    def create
        meme = Meme.create(meme_params)
        render json: meme
    end

    def update
        meme = Meme.find(params[:id]) 
        meme.update(meme_params)
    end

    def destroy
        
    end

    private
    def meme_params
        params.require(:meme).permit(:title, :likes, :dislikes, :image, :description)
    end

end
