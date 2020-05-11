class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
    @message.images.new
    # @message.images.build
  end 

  def create
    # binding.pry
    # @message = current_user.messages.build(message_params)
    @message = Message.new(message_params)
    # @message = @message.images.new(message_params)
    # if Message.create(message_params)
    if @message.valid?
       @message.save
    # if @message.save
      redirect_to root_path
    else  
      # flash.now[:alert]= "投稿が失敗しました"
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private 
  def message_params
    params.require(:message).permit(:content, images_attributes: [:image, :id]).merge(user_id: current_user.id)
    # params.require(:product).permit(:name, images_attributes: [:image, :id]).merge(user_id: current_user.id)
  end
end  
