class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  #before_action :check_role, only: [:create_admin]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  def create_admin
    @user = User.new(user_params)

    if @user.save
      render json: { user: @user, message: 'Usuário criado com sucesso!' }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { user: @user, message: 'Usuário criado com sucesso!' }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  '''def check_role
      unless current_user&.admin? || current_user&.seller?
        redirect_to root_path, alert: "Você não tem permissão para acessar essa página."
      end
    end'''

    def set_user
      @user = User.find(params.expect(:id))
    end

    def user_params
      params.expect(user: [ :name, :email, :password, :address, :company_name, :cnpj, :phone, :role ])
    end
end
