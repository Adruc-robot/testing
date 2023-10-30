class ListEntriesController < ApplicationController
  before_action :get_list
  before_action :set_list_entry, only: %i[ show edit update destroy ]
  #pulled from recipes - dig into details
  before_action :authenticate_user!

  # GET /list_entries or /list_entries.json
  def index
    #@list_entries = ListEntry.all
    #This might not be used anymore, but mirroring the set up of the recipe_ingredients controller
    #@list_entries = @list.list_entries.includes(:list).order("list.name ASC, list_entry.order_number DESC")
    #@list_entries = @list.list_entries.order("list_entry.order_number")
    @list_entries = @list.list_entries.order(:order_number)
  end

  # GET /list_entries/1 or /list_entries/1.json
  def show
  end

  # GET /list_entries/new
  def new
    #@list_entry = ListEntry.new
    @list_entry = @list.list_entries.new
    @form_txt = "Create " + @list.name + " item"
  end

  # GET /list_entries/1/edit
  def edit
    @form_txt = "Save"
  end

  # POST /list_entries or /list_entries.json
  def create
    #@list_entry = ListEntry.new(list_entry_params)
    @list_entry = @list.list_entries.new(list_entry_params)

    respond_to do |format|
      if @list_entry.save
        #format.html { redirect_to list_entry_url(@list_entry), notice: "List entry was successfully created." }
        
        format.html { redirect_to list_list_entries_path(@list_entry.list_id), notice: "List entry was successfully created." }
        format.json { render :show, status: :created, location: @list_entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /list_entries/1 or /list_entries/1.json
  def update
    #somthing probalby needs to be here - reference recipe steps or just mirror the @list_entry from above
    respond_to do |format|
      if @list_entry.update(list_entry_params)
        format.html { redirect_to list_list_entries_path(@list_entry.list), notice: "List entry was successfully updated."}
        #format.html { redirect_to list_entry_url(@list_entry), notice: "List entry was successfully updated." }
        format.json { render :show, status: :ok, location: @list_entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /list_entries/1 or /list_entries/1.json
  def destroy
    @list_entry.destroy

    respond_to do |format|
      format.html { redirect_to list_entries_url, notice: "List entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_list
      @list = List.find(params[:list_id])
    end
    def set_list_entry
      #@list_entry = ListEntry.find(params[:id])
      @list_entry = ListEntry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_entry_params
      params.require(:list_entry).permit(:list_id, :name, :value, :order_number)
    end

    # work to link list_entries to lists
end
