class RelationshipsController < ApplicationController
  def create
  	@relationship = Relationship.new(following_id: params[:following_id], follower_id: current_user.id)
 	@relationship.save
 	redirect_back(fallback_location: top_path)
  end

  def destroy
  	@relationship = Relationship.find_by(following_id: params[:id], follower_id: current_user.id)
  	@relationship.delete
  	redirect_back(fallback_location: top_path)
  end

end
