class OrdersController < ApplicationController
    before_action :authenticate_user!, except: :index

    def index
        #@order = Item.find(params[:id])
        @item = Item.find(params[:item_id])
        @order_address = OrderAddress.new
    end

    def create
        @item = Item.find(params[:item_id])
        @order_address = OrderAddress.new(order_params) 
        if @order_address.valid?
          @order_address.save
          redirect_to root_path
        else
          render :index, status: :unprocessable_entity
        end
    end

    private

    def order_params
        #params.require(:order_address).permit( :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id, :item_id).merge(user_id: current_user.id)
        params.require(:order_address).permit( :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id).merge(item_id: @item.id).merge(user_id: current_user.id)
    end

end
