class CommentsController < ApplicationController
 
  def create
    comment = Comment.create(comment_params)
    redirect_to messages_path(comment.message.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: currnt_user.id, message_id: params[:message_id])
  end

end
