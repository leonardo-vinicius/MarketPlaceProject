class EnterprisesController < ApplicationController
  before_action :set_enterprise, only: %i[show edit update destroy]

  # GET /enterprises or /enterprises.json
  def index
    @enterprises = Enterprise.all
    render json: @enterprises
  end

  # GET /enterprises/1 or /enterprises/1.json
  def show
    render json: @enterprise
  end

  # GET /enterprises/new
  def new
    @enterprise = Enterprise.new
  end

  # GET /enterprises/1/edit
  def edit
  end

  # POST /enterprises or /enterprises.json
  def create
    @enterprise = Enterprise.new(enterprise_params)

    if @enterprise.save
      render json: { enterprise: @enterprise, message: 'Enterprise was successfully created.' }, status: :created
    else
      render json: { errors: @enterprise.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /enterprises/1 or /enterprises/1.json
  def update
    if @enterprise.update(enterprise_params)
      render json: { enterprise: @enterprise, message: 'Enterprise was successfully updated.' }, status: :ok
    else
      render json: { errors: @enterprise.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /enterprises/1 or /enterprises/1.json
  def destroy
    @enterprise.destroy

    render json: { message: 'Enterprise was successfully destroyed.' }, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enterprise
      @enterprise = Enterprise.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def enterprise_params
      params.require(:enterprise).permit(:name, :email, :phone, :cnpj, :seller_id)
    end
end
