class MessagesController < ApplicationController
  before_action :move_to_index, except: [:index, :old_messages, :show]

  def index
    @messages = Message.includes(:user).order('created_at DESC').page(params[:page]).per(12)
    # @list_tags = nil
    @list_tags = Tag.unscoped.joins(:message_tags).group(:id, :tag_id).order('count(tag_id) DESC')
    # @list_tags = Tag.joins(:message_tags).group(:tag_id).order('count(tag_id) DESC')
    # @most_views = Message.order("impressions_count DESC").take(10)
    # @posts = Post.joins(:tags).where(tags: {title: params[:tag]})
  end
  
  def old_message
    @list_tags = Tag.unscoped.joins(:message_tags).group(:id, :tag_id).order('count(tag_id) DESC')
    @old_messages = Message.includes(:user).order('created_at ASC').page(params[:page]).per(12)
  end

  def rank_message
    @list_tags = Tag.unscoped.joins(:message_tags).group(:id, :tag_id).order('count(tag_id) DESC')
    @all_ranks = Message.find(Like.group(:message_id).order('count(message_id) desc').limit(10).count(:message_id).keys)
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
    tag_list = params[:message][:tag][:tag_name].split(",")
    # @message = @message.images.new(message_params)
    # if Message.create(message_params)
     
    if @message.valid?
       @message.save_messages(tag_list) if params[:message][:tag][:tag_name].presence
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
      # binding.pry
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

    def move_to_index
      redirect_to action: :index unless logged_in?
    end
    
end  
