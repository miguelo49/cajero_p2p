class ExchangesController < ApplicationController

  def index
    @exchanges = Exchange.where(status: :pending, user_id: current_user.id)
  end

end