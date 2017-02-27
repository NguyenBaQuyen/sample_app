class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :find_user, only: [:index, :create]

  def index
    relationship = params[:relationship]
    @title = relationship
    @users = @user.send(relationship).paginate page: params[:page]
  end

  def create
    current_user.follow @user
    @user_followed = current_user.active_relationships.find_by followed_id: @user.id
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  def destroy
    user = Relationship.find_by id: params[:id].followed
    current_user.unfollow user
    @user_follower = current_user.active_relationships.build
    respond_to do |format|
      format.html {redirect_to @user}
      format.js
    end
  end

  private
  def find_user
    @user = if params[:followed_id]
      User.find_by id: params[:followed_id]
    else
      User.find_by id: params[:user_id]
    end
    unless @user
      flash[:danger] = "user not found"
      redirect_to root_path
    end
  end
end
