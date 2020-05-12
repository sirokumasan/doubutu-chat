class LikesController < ApplicationController
  before_action :set_variables

  def like
    @like = current_user.likes.new(message_id: @message.id)
    @lile.save
  end

  def unlike
    like = current_user.likes.find_by(message_id: @message.id)
    like.destroy
  end

  privat
  def set_variables
    @message = Message.find(params[:message_id])
  end

end
