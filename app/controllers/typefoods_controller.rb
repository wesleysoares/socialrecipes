class TypefoodsController < ApplicationController
  def new
    @typefood = Typefood.new
  end

  def create
    @typefood = Typefood.new(typefood_params)
    if @typefood.save
      redirect_to @typefood
    else
      render 'new'
    end
  end

  def show
    @typefood = Typefood.find(params[:id])
  end

  private

  def typefood_params
    params.require(:typefood).permit(:name)
  end
end
