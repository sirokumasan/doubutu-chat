class RelationshipsController < ApplicationController
  #before_action :logged_in_user

  #POsT/relationships
  def create
    #binding.pry
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow(@user)
    redirect_to root_url
  end

  # delete/relationships/:id
  def destroy  
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user
  end

end
