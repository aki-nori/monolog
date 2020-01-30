class RelationshipsController < ApplicationController
	before_action :authenticate_user!


  def create

  	@relationship = Relationship.new(following_id: params[:following_id], follower_id: current_user.id)
 		@relationship.save

 		@info_user = User.find(params[:info_user])
  	if params[:following_id] != nil
  		@user = User.find(params[:following_id])
  	else
  		@user = User.find(params[:id])
  	end
 		# redirect_back(fallback_location: top_path)
  end

  def destroy
  	@relationship = Relationship.find_by(following_id: params[:id], follower_id: current_user.id)
  	@relationship.delete


  	@info_user = User.find(params[:info_user])
  	if params[:following_id] != nil
  		@user = User.find(params[:following_id])
  	else
  		@user = User.find(params[:id])
  	end
  	# redirect_back(fallback_location: top_path)
  end

  private

end
