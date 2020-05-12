class LikesController < ApplicationController
  before_action :set_variables

  def like
    @like = Like.create(user_id: current_user.id, message_id: params[:message_id])
    @likes = Like.where(message_id: params[:message_id])
    @messages = Message.includes(:user)
  end

  def unlike
    @like = Like.find_by(user_id: current_user.id, message_id: params[:message_id])
    @like.destroy
    @likes = Like.where(message_id: params[:message_id])
    @messages = Message.includes(:user)
  end

  private
  def set_variables
    @message = Message.find(params[:message_id])
  end

end
