class BookmarksController < ApplicationController

  def new
    # We need @bookmark in our `simple_form_for`
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end


  def create
    @bookmark = Bookmark.new(bookmark_params)
    @list = List.find(params[:list_id])

    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to movie_path(@bookmark.movie), status: :see_other
  end

private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end

end
