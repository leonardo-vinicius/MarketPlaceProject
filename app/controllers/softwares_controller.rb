class SoftwaresController < ApplicationController
  before_action :set_software, only: %i[ show edit update destroy ]

  # GET /softwares or /softwares.json
  def index
    @softwares = Software.all
  end

  # GET /softwares/1 or /softwares/1.json
  def show
  end

  # GET /softwares/new
  def new
    @software = Software.new
  end

  # GET /softwares/1/edit
  def edit
  end

  # POST /softwares or /softwares.json
  def create
    @software = Software.new(software_params)

    if @software.save
      render json: { user: @software, message: 'Software criado com sucesso!' }, status: :created
    else
      render json: { errors: @software.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /softwares/1 or /softwares/1.json
  def update
    if @software.update
      render json: { user: @software, message: 'Software atualizado com sucesso!' }, status: :created
    else
      render json: { errors: @software.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /softwares/1 or /softwares/1.json
  def destroy
    @software.destroy!

    render json: { message: "Software foi removido com sucesso!" }, status: :no_content
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_software
      @software = Software.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def software_params
      params.expect(software: [ :name, :description, :status, :price, :category, :seller_id ])
    end
end
