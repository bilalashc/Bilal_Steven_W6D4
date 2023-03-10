class CatsController < ApplicationController
    def index
        @cats = Cat.all
        render :index
    end

    def create
        @cat = Cat.new(cats_param)
        
        if @cat.save!
            redirect_to cat_url(@cat)
        else
            render json: ["I couldn't create this cat :("], status: 421
        end
    end

    def show
        @cat = Cat.find_by(params[:id])

        if @cat
            render :show
        else
            # render json: Cats.error.full_messages, status: 404
            render json: ['I cannot find this cat'], status: 404
        end
    end

    def edit
        @cat = Cat.find(params[:id])
        render :edit
    end

    def update
        @cat = Cat.find(params[:id])

        if @cat && @cat.update(cats_param)
            redirect_to cat_url(@cat)
        else
            render json: ["The cat wasn't found or you enter the wrong information."], status: 421
        end
    end

    private
    def cats_param
        params.require(:cats).permit(:birth_date, :color, :name, :sex, :description)
    end
end