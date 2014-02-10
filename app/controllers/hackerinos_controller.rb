class HackerinosController < ApplicationController
    def new
        @hackerino = Hackerino.new
    end

    def unvote
        @hackerino = Hackerino.find(params[:id])
        @hackerino.vote -= 1
        respond_to do |f|
            if @hackerino.save
                f.js
            end
        end
    end

    def vote
        @hackerino = Hackerino.find(params[:id])
        @hackerino.vote += 1
        respond_to do |f|
            if @hackerino.save
                f.js
            end
        end
    end

    def create
        @hackerino = Hackerino.new(hackerino_params)
        @hackerino.vote = 0
        if @hackerino.save
            redirect_to '/'
        else
           render 'new' 
        end
    end

    def index
        @hackerinos = Hackerino.all
    end

    private
        def hackerino_params
            params.require(:hackerino).permit(:title, :url, :author)
        end
end
