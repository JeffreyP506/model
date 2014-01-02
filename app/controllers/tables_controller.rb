class TablesController < ApplicationController
  include CurrentChange
  before_action :signed_in_user, except: [:index, :show]
  before_action :set_working_change, only: :index

  def new
    @table = Table.new
    3.times { @table.columns.build }
  end

  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to @table, notice: "Successfully created table"
    else
      render 'new'
    end
  end

  def edit
    @table = Table.find(params[:id])
  end


  def show
    @table = Table.find(params[:id])
    @sql = @table.sql
    respond_to do |format|
      format.html
      format.csv { send_data @table.my_to_csv }
      format.xls
    end
  end

  def index
    # @search = Table.search(params[:search])
    # @table_ids = Column.select(table_id).search(params[:search]).distinct
    # @tables = Table.search(params[:search]).paginate(page: params[:page], per_page: 10)
    # @tables = @search.result(:distinct => true)
    #.paginate(page: params[:page], per_page: 10)
    @tables = Table.joins(:columns).search(params[:search]).distinct.paginate(page: params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data @tables.my_to_csv }
      format.xls
    end
  end

  def update
    @table = Table.find(params[:id])

    if @table.update(table_params)
      redirect_to @table
    else
      render 'edit'
    end
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy

    redirect_to tables_path
  end

  private
  def table_params
    params.require(:table).permit(:name, :cname, :file, :ptk, columns_attributes:
                                  [ :id, :name, :cname, :dtype, :null_ind, :pk, :note, :_destroy, :position ])
  end

end

