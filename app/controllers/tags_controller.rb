class TagsController < ApplicationController

  def index
    @tags = Tag.where(tag_name: params[:tag_name])
    # @list_tags = Tag.joins(:message_tags).group(:tag_id).order('count(tag_id) DESC')
  end

end
