class TablesController < ApplicationController

  http_basic_authenticate_with name: "pjf", password: "pjfmodel", except: [:index, :show]

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)

    if @table.save
      redirect_to @table
    else
      render 'new'
    end
  end

  def edit
    @table = Table.find(params[:id])
  end


  def show
    @table = Table.find(params[:id])
  end

  def index
    # @search = Table.search(params[:search])
    # @table_ids = Column.select(table_id).search(params[:search]).distinct
    # @tables = Table.search(params[:search]).paginate(page: params[:page], per_page: 10)
    # @tables = @search.result(:distinct => true)
    #.paginate(page: params[:page], per_page: 10)
    @tables = Table.joins(:columns).search(params[:search]).paginate(page: params[:page])
  end

  def update
    @table = Table.find(params[:id])

    if @table.update(params[:post].permit(:name, :cname, :file, :ptk))
      redirect_to @table
    else
      rencer 'edit'
    end
  end

  def destroy
    @table = Table.find(params[:id])
    @table.destroy

    redirect_to tables_path
  end

  private
  def table_params
    params.require(:table).permit(:name, :cname, :file, :ptk)
  end

end

