class RfqsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_rfq, only: %i[show edit update destroy]
  before_action :authorize_rfq_owner, only: %i[show edit update destroy]

  # GET /rfqs or /rfqs.json
  def index
    @rfqs = current_user.rfqs.all
  end

  # GET /rfqs/1 or /rfqs/1.json
  def show
    # The authorize_rfq_owner callback ensures the user can view this RFQ
  end

  # GET /rfqs/new
  def new
    @rfq = current_user.rfqs.new
    @rfq.items.build # Initialize one empty item in the RFQ
  end

  # GET /rfqs/1/edit
  def edit
    # The authorize_rfq_owner callback ensures the user can edit this RFQ
  end

  # POST /rfqs or /rfqs.json
  def create
    @rfq = current_user.rfqs.new(rfq_params)

    respond_to do |format|
      if @rfq.save
        format.html { redirect_to @rfq, notice: "RFQ was successfully created." }
        format.json { render :show, status: :created, location: @rfq }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rfq.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rfqs/1 or /rfqs/1.json
  def update
    respond_to do |format|
      if @rfq.update(rfq_params)
        format.html { redirect_to @rfq, notice: "RFQ was successfully updated." }
        format.json { render :show, status: :ok, location: @rfq }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rfq.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rfqs/1 or /rfqs/1.json
  def destroy
    @rfq.destroy

    respond_to do |format|
      format.html { redirect_to rfqs_path, status: :see_other, notice: "RFQ was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_rfq
    @rfq = current_user.rfqs.find_by(id: params[:id])
    # If no RFQ is found or the RFQ doesn't belong to the current_user, redirect with an error
    redirect_to rfqs_path, alert: "RFQ not found or you are not authorized to access it." if @rfq.nil?
  end

  # Custom authorization method to ensure the user owns the RFQ
  def authorize_rfq_owner
    unless @rfq.user == current_user
      redirect_to rfqs_path, alert: "You are not authorized to view or modify this RFQ."
    end
  end

  # Only allow a list of trusted parameters through.
  def rfq_params
    params.require(:rfq).permit(
      :some_other_attribute, # Replace with any other attributes of RFQ
      items_attributes: [ :id, :description, :quantity, :_destroy ]
    )
  end
end
