class TagsController < ApplicationController

  def index
    @tags = Tag.where(tag_name: params[:tag_name])
    @all_ranks = Message.find(Like.group(:message_id).order('count(message_id) desc').limit(10).count(:message_id).keys)
    @most_views = Message.order("impressions_count DESC").take(10)
    @list_tags = Tag.unscoped.joins(:message_tags).group(:id, :tag_id).order('count(tag_id) DESC')
  end

end
