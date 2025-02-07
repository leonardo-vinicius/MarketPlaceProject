class HomeController < ApplicationController
  #before_action :authenticate_user!

  def onboarding
    @recommended_softwares = Software.limit(5)
  end

  def index
    #render json: { message: 'Hello, world!'}
    @softwares = Software.all
  end
end