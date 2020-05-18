class MessagesController < ApplicationController
  def index
    @messages = Message.includes(:user)
    @all_ranks = Message.find(Like.group(:message_id).order('count(message_id) desc').limit(10).count(:message_id).keys)
    @most_views = Message.order("impressions_count DESC").take(10)
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
    @comment = Comment.new
    @comments = @message.comments.includes(:user).order("created_at DESC")
    @like = Like.new
    #impressionist(@message, nil, :unique => [:session_hash])
    @page_views = @message.impressionist_count
    #where("created_at <= ?", Time.now)
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    # binding.pry
    @message = Message.find(params[:id])
    if  @message.update(message_params)
      redirect_to root_path
    else  
      render :new
    end
  end

  def destroy
    message = Message.find(params[:id])
    message.destroy
    redirect_to root_path
  end

  def rnking
    @all_ranks = Message.rnking
  end

  private 

    def message_params
      params.require(:message).permit(:content, :tag_ids, images_attributes: [:image, :_destroy, :id, :tags]).merge(user_id: current_user.id)
      # params.require(:product).permit(:name, images_attributes: [:image, :id]).merge(user_id: current_user.id)
    end
    
end  
