class MessagesController < ApplicationController
  def index
  end

  def new
    @message = Message.new
    @message.build_image
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to :root_path
    else  
      # flash.now[:alert]= "投稿が失敗しました"
      render :new
    end
  end

  private 
  def message_params
    params.require(:message).permit(:content, images_attributes:[:image]).merge(user_id: current_user.id)
end
