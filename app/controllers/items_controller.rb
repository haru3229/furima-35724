class ItemsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show]

  def index
  #   @items = Item.all
  end

  # def show
  # end

  # def new
  #   @item = Item.new
  # end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
end