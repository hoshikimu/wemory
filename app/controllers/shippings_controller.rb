class ShippingsController < ApplicationController
  before_action :ensure_correct_user?, only: :edit

  def ensure_correct_user?
    shipping_user_id = Shipping.find(params[:id]).user_id
    if shipping_user_id != current_user.id
      redirect_to top_path
      flash[:alert] = "閲覧権限がありません。"
    end
  end

  def new
    @shippings = Shipping.where(user_id: current_user.id)
    @new_shipping = Shipping.new
  end

  def create
    @new_shipping = Shipping.new(shipping_params)
    @new_shipping.user_id = current_user.id
    if @new_shipping.save
      flash[:success] = "配送先を作成しました！"
      redirect_to new_shipping_path
    else
      @shippings = Shipping.where(user_id: current_user.id)
      render :new
    end
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      flash[:success] = "配送先を編集しました！"
      redirect_to new_shipping_path
    else
      render :edit
    end
  end

  def destroy
    shipping = Shipping.find(params[:id])
    if shipping.destroy
      flash[:success] = "配送先を削除しました！"
      redirect_to new_shipping_path
    end
  end

  private
  def shipping_params
    params.require(:shipping).permit(:postal_code, :prefecture_code, :address_city, :address_street, :address_building, :receiver, :phone_number)
  end
end
