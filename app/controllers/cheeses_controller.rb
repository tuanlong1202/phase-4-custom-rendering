class CheesesController < ApplicationController

  # GET /cheeses
  def index
    cheeses = Cheese.all
    render json: cheeses
  end

  # GET /cheeses/:id
  def show
    cheese = Cheese.find_by(id: params[:id])
    #render json: cheese, only:[:id,:name,:price,:is_best_seller]
    if cheese
      render json: cheese, except: [:create_at,:update_at], methods:[:summary]
    else
      render json: {error:  'Cheese not found'}, status: :not_found
    end
  end

end
