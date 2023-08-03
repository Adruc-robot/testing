class ReceiptsController < ApplicationController
  before_action :set_receipt, only: %i[ show edit update destroy ]

  # GET /receipts or /receipts.json
  def index
    #@receipts = Receipt.all
    @receipts = current_user.receipts
    #@list = List.where(id: receipt.list_id)
    #@list_entry = ListEntry.where(id: receipt.list_entry.id)
  end

  # GET /receipts/1 or /receipts/1.json
  def show
    
  end

  # GET /receipts/new
  def new
    @receipt = Receipt.new
    @businesses = Business.where(user_id: current_user.id)
    @lists = List.where(user_id: current_user.id)
    @accounts = Account.where(user_id: current_user.id)
  end

  # GET /receipts/1/edit
  def edit
    @businesses = Business.where(user_id: current_user.id)
    @lists = List.where(user_id: current_user.id)
    @list_entries = ListEntry.where(list_id: @receipt.list_id)
    @accounts = Account.where(user_id: current_user.id)
  end

  # POST /receipts or /receipts.json
  def create
    @receipt = Receipt.new(receipt_params)

    respond_to do |format|
      if @receipt.save
        format.html { redirect_to receipts_path, notice: "Receipt was successfully created." }
        #format.html { redirect_to receipt_url(@receipt), notice: "Receipt was successfully created." }
        format.json { render :show, status: :created, location: @receipt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receipts/1 or /receipts/1.json
  def update
    respond_to do |format|
      if @receipt.update(receipt_params)
        format.html { redirect_to receipts_path, notice: "Receipt was successfully updated." }
        #format.html { redirect_to receipt_url(@receipt), notice: "Receipt was successfully updated." }
        format.json { render :show, status: :ok, location: @receipt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @receipt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receipts/1 or /receipts/1.json
  def destroy
    @receipt.destroy

    respond_to do |format|
      format.html { redirect_to receipts_url, notice: "Receipt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receipt
      @receipt = Receipt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def receipt_params
      params.require(:receipt).permit(:user_id, :business_id, :subtotal, :total, :image, :image_description, :list_id, :list_entry_id, :account_id)
    end
end
