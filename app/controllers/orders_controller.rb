class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :move_to_item_index

    def index
        @order_address = OrderAddress.new
    end

    def create
        @order_address = OrderAddress.new(order_params) 
        if @order_address.valid?
          pay_item
          @order_address.save
          redirect_to root_path
        else
          render :index, status: :unprocessable_entity
        end
    end

    private

    def order_params
      params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: @item.id, user_id: current_user.id, token: params[:token])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
    end

    def move_to_item_index
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      @item = Item.find(params[:item_id])
      if current_user == @item.user
        redirect_to root_path
      elsif !@item.order.nil?
        redirect_to root_path
      end
    end

   
end
