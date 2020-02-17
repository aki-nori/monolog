class RelationshipsController < ApplicationController
	before_action :authenticate_user!
  before_action :find_info_user

  def create
  	@relationship = Relationship.new(following_id: params[:following_id], follower_id: current_user.id)
 		@relationship.save
  	@user = User.find(params[:following_id])
  end

  def destroy
  	@relationship = Relationship.find_by(following_id: params[:id], follower_id: current_user.id)
  	@relationship.delete
    @user = User.find(params[:id])
  end

  private

  def find_info_user
    @info_user = User.find(params[:info_user])
  end

end
