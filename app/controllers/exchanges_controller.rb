class ExchangesController < ApplicationController

  def index
    @exchanges = Exchange.where(status: :available)
  end

  def show
    @exchange = Exchange.find(params[:id])
  end

  def new
    @exchange = Exchange.new
  end

  def create
    @exchange = current_user.exchanges.build(exchange_params)
    @exchange.status = "public"

    if @exchange.save
      redirect_to root_path, notice: "Oferta creada exitosamente"
    else
      render :new
    end
  end

  def update
    @exchange = Exchange.find(params[:id])
    @exchange.update(status: "private")
    redirect_to root_path, notice: "Intercambio iniciado"
  end

  def complete
    @exchange = Exchange.find(params[:id])
    @exchange.update(status: "completed")
    redirect_to root_path, notice: "Intercambio completado"
  end

  private

  def exchange_params
    params.require(:exchange).permit(:amount, :exchange_type, :address)
  end

end