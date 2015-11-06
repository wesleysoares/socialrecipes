class KitchensController < ApplicationController
  def new
    @kitchen = Kitchen.new
  end

  def create
    @kitchen = Kitchen.new(kitchen_params)
    if @kitchen.save
      redirect_to @kitchen
    else
      render 'new'
    end
  end

  def show
    @kitchen = Kitchen.find(params[:id])
  end

  private

  def kitchen_params
    params.require(:kitchen).permit(:name)
  end
end
