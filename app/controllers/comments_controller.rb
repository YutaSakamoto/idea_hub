class CommentsController < ApplicationController
  def index
    @comment_topics = current_user.comment_topics
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.topic_id = params[:topic_id]
    if @comment.save
      redirect_to topic_path(topic.id), success: 'コメントしました'
    else
      flash.now[:danger] = 'コメントに失敗しました'
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:image, :text)
  end
end
