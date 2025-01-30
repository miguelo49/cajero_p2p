class ExchangesController < ApplicationController

  def index
    @exchanges = Exchange.where(status: :available).where.not(user: current_user)
  end

  def show
    @exchange = Exchange.find(params[:id])
  end

  def new
    @exchange = Exchange.new
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
    byebug
    @exchange = Exchange.find(params[:id])
    @exchange.update(status: :pending)
    redirect_to exchanges_path, notice: "Intercambio iniciado"
  end

  def complete
    @exchange = Exchange.find(params[:id])
    @exchange.update(status: :completed)
    redirect_to exchanges_path, notice: "Intercambio completado"
  end

  private

  def exchange_params
    params.require(:exchange).permit(:amount, :exchange_type, :address)
  end

end