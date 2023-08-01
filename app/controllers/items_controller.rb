class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit 
  end
  def update
    @item = Item.find(params[:id])
    if user_signed_in? && current_user == @item.user
       if @item.update(item_params)
          redirect_to root_path
        else
          render :edit, status: :unprocessable_entity
        end
    else
      redirect_to new_user_session_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id,
                                 :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end

end
