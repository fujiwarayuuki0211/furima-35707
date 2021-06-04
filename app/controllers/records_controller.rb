class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :now_user, only: [:index, :create]
  before_action :set_item, only: [:index, :create, :pay_item, :now_user]

  def index
    @record_address = RecordAddress.new
  end

  def create
    @record_address = RecordAddress.new(record_address_params)
    if @record_address.valid?
      pay_item
      @record_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def record_address_params
    params.require(:record_address).permit(:postal_code, :prefecture_id, :municipality, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: record_address_params[:token],
      currency: 'jpy'
    )
  end

  def now_user
    redirect_to root_path if current_user.id == @item.user_id && @item.record.present?
  end

end
