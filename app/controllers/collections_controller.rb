class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def new
    @collection = Collection.new
  end

  def show
    @collection = Collection.find(params[:id])
    @user = User.find(params[:id])
  end

  def create
    @collection = current_user.collections.new(collection_params)

    if @collection.save
      redirect_to collections_path, success: 'アイデアを募集しました'
    else
      flash.now[:danger] = '募集に失敗しました'
      render :new
    end
  end

  private
  def collection_params
    params.require(:collection).permit(:title, :text)
  end
end
