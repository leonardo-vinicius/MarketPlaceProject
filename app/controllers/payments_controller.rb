class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]

  # GET /payments or /payments.json
  def index
    @payments = Payment.all
    render json: @payments
  end

  # GET /payments/1 or /payments/1.json
  def show
    render json: @payment
  end

  # GET /payments/new
  def new
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)

    if @payment.save
      render json: { payment: @payment, message: 'Payment was successfully created.' }, status: :created
    else
      render json: { errors: @payment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    if @payment.update(payment_params)
      render json: { payment: @payment, message: 'Payment was successfully updated.' }, status: :ok
    else
      render json: { errors: @payment.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    render json: { message: 'Payment was successfully destroyed.' }, status: :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:software_id, :buyer_id, :price, :purchase_date)
    end
end