class ExchangesController < ApplicationController
  before_action :require_user_info, only: [:new, :create]

  def index
    @exchanges = Exchange.where(status: "public")
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

  def require_user_info
    unless current_user.has_complete_info?
      redirect_to new_user_path, alert: "Por favor, complete sus datos antes de crear una oferta"
    end
  end
end