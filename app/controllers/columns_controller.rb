class ColumnsController < ApplicationController

  http_basic_authenticate_with name: "pjf", password: "pjfmodel", only: [:create, :destroy]

  def create
    @table = Table.find(params[:table_id])
    @column = @table.columns.create(params[:column].permit(:name, :cname, :null_ind, :pk, :note))
    redirect_to table_path(@table)
  end

  def destroy
    @table = Table.find(params[:table_id])
    @column = @table.columns.find(params[:id])
    @column.destroy
    redirect_to table_path(@table)
  end

end
