class OnboardingController < ApplicationController
  def step1
  end

  def step2
    session[:answer1] = params[:answer1] if params[:answer1].present?
  end

  def step3
    session[:answer2] = params[:answer2] if params[:answer2].present?
  end

 
  def destroy_step3
    session[:answer2] = nil
    redirect_to onboarding_step2_path
  end

  def destroy_step2
    session[:answer2] = nil
    redirect_to onboarding_step1_path, notice: "Passo 2 foi reiniciado."
  end

  def testing_software
    @software = Software.find(params[:software_id])
  end

  def recommendations
    session[:answer3] = params[:answer3] if params[:answer3].present?
  
    free_price = session[:answer2] == 'Livre'
    until_1000 = session[:answer2] == 'Até R$1000'
    tech_support = session[:answer3] == 'Sim'
  
    recommended_softwares = Software.where(category: session[:answer1], tech_support: tech_support)
  
    case session[:answer2]
    when 'Livre'
      @recommended_softwares = recommended_softwares
    when 'Até R$1000'
      @recommended_softwares = recommended_softwares.where('price < ?', 100)
    else
      @recommended_softwares = recommended_softwares.where('price > ?', 100)
    end
  
    @recommended_softwares
  end
end
