class ExchangesController < ApplicationController

  def index
    @pending_exchanges = Exchange.where(status: :pending, buyer_id: current_user.id)
    @exchanges = Exchange.where(status: :available).where.not(user_id: current_user.id)
  end

  def show
    @exchange = Exchange.find(params[:id])
  end

  def new
    @exchange = Exchange.new(address: current_user.address)
  end

  def create
    @exchange = current_user.exchanges.build(exchange_params)
    @exchange.status = "available"

    if @exchange.save
      redirect_to exchanges_path, notice: "Oferta creada exitosamente"
    else
      render :new
    end
  end

  def update
    @exchange = Exchange.find(params[:id])
    exchange_params = params.require(:exchange).permit(:status)
    byebug
    exchange_params = exchange_params.merge(buyer_id: current_user.id) if exchange_params[:status] == "pending"
    @exchange.update(exchange_params)
    redirect_to exchanges_path, notice: "Intercambio iniciado"
  end

  private

  def exchange_params
    params.require(:exchange).permit(:amount, :exchange_type, :address)
  end


end