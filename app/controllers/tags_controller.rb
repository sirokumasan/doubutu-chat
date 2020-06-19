class TagsController < ApplicationController

  def index
    @tags = Tag.where(tag_name: params[:tag_name])
    # @tag = @tags.messages.split(",")
    # @tag = @tags.split(",")
    # @messages = @tag.messages.order('created_at DESC').page(params[:page]).per(1)
    # @messages = Message.includes(:user).order('created_at DESC')
    #@image = Image.message  #.includes(:message)
    @all_ranks = Message.find(Like.group(:message_id).order('count(message_id) desc').limit(10).count(:message_id).keys)
    @most_views = Message.order("impressions_count DESC").take(10)
    @list_tags = Tag.joins(:message_tags).group(:tag_id).order('count(tag_id) DESC')

  end

end
