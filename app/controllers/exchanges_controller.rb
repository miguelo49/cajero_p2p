class ExchangesController < ApplicationController
  def index
    @exchanges = Exchange.available
    @exchanges = @exchanges.by_amount_range(params[:min_amount], params[:max_amount]) if params[:min_amount].present? || params[:max_amount].present?
    @exchanges = @exchanges.by_location(params[:location]) if params[:location].present?
    @locations = Exchange.distinct.pluck(:location)
  end

  def new
    @exchange = current_user.exchanges.new
  end

  def create
    @exchange = current_user.exchanges.new(exchange_params)
    if @exchange.save
      redirect_to @exchange, notice: "Exchange was successfully created."
    else
      render :new
    end
  end

  def update
    if @exchange.update(exchange_params)
      redirect_to @exchange, notice: "Exchange was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @exchange.destroy
    redirect_to exchanges_url, notice: "Exchange was successfully destroyed."
  end

  private

  def set_exchange
    @exchange = Exchange.find(params[:id])
  end

  def exchange_params
    params.require(:exchange).permit(:amount, :exchange_type, :location, :status)
  end
end
