class UserExchangesController < ApplicationController
  before_action :authenticate_user!

  def index
    @exchanges = Exchange.where(user_id: current_user.id)
  end

end