class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    #render json: { message: 'Hello, world!'}
    @softwares = Software.all
  end
end