class HomeController < ApplicationController
  def index
    @exchanges = Exchange.where(status: "public")
  end
end