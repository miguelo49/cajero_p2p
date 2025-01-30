class HomeController < ApplicationController
  def index
    @exchanges = Exchange.where(status: :available)
  end
end