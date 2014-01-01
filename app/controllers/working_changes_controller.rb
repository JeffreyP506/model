class WorkingChangesController < ApplicationController
  before_action :set_working_change, only: [:show, :edit, :update, :destroy]

  # GET /working_changes
  # GET /working_changes.json
  def index
    @working_changes = WorkingChange.all
  end

  # GET /working_changes/1
  # GET /working_changes/1.json
  def show
    @working_change = WorkingChange.find(params[:id])
    @sql = working_change_sql @working_change
    respond_to do |format|
      format.html
      format.csv { send_data @working_change.csv }
      format.xls
    end
  end

  # GET /working_changes/new
  def new
    @working_change = WorkingChange.new
  end

  # GET /working_changes/1/edit
  def edit
  end

  # POST /working_changes
  # POST /working_changes.json
  def create
    @working_change = WorkingChange.new(working_change_params)

    respond_to do |format|
      if @working_change.save
        format.html { redirect_to @working_change, notice: 'Working change was successfully created.' }
        format.json { render action: 'show', status: :created, location: @working_change }
      else
        format.html { render action: 'new' }
        format.json { render json: @working_change.debugs, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /working_changes/1
  # PATCH/PUT /working_changes/1.json
  def update
    respond_to do |format|
      if @working_change.update(working_change_params)
        format.html { redirect_to @working_change, notice: 'Working change was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @working_change.debugs, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /working_changes/1
  # DELETE /working_changes/1.json
  def destroy
    @working_change.destroy if @working_change.id == session[:change_id]
    session[:change_id] = nil
    respond_to do |format|
      format.html { redirect_to tables_url, notice: '当前变更为空' }
      format.js
      format.json { head :no_content }
    end
  end

  def working_change_sql(working_change)
    sqls = []
    working_change.line_items.each do |line_item|
      sqls << line_item.table.sql
    end
    sqls.join("\n")
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_working_change
      @working_change = WorkingChange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def working_change_params
      params[:working_change]
    end

end
