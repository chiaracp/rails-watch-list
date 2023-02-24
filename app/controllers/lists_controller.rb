class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    # We need @restaurant in our `simple_form_for`
    @list = List.new

  end

  def create
    @list = List.new()

    @list.save # Will raise ActiveModel::ForbiddenAttributesError
  end

  def create
    @list = List.new(list_params)
    @list.bookmark = @bookmark
    @list.save

  end


  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
