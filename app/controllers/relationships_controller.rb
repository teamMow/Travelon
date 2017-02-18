class RelationshipsController < ApplicationController
before_action :authenticate_user!

  def create
  	@user = User.find(params[:user_id])
  	follow = current_user.relationship.build(following_id: @user.id)

  	if follow.save
  		redirect_to articles_path, notice: "フォローしました"
  	else
  		redirect_to articles_path, alert: "フォローできません"
  	end
  end


  def destroy
  	@user = User.find(params[:user_id])
  	follow = current_user.relationship.find_by!(following_id: @user.id)
  	follow.destroy
  	redirect_to articles_path, notice: "フォローを解除しました"
  end

end
