class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :role, :address, :company_name, :cnpj])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :role, :address, :company_name, :cnpj])
  end

  def after_sign_in_path_for(resource)
    puts resource
    root_path
    
    #if resource.admin?
    #  admin_dashboard_path # Redireciona para o painel de administração se for admin
    #else
    #  home_path # Redireciona para a home se for um usuário comum
    #end
  end

end