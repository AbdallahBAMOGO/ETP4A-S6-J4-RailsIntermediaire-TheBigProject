class LikesController < ApplicationController
  before_action :require_login

  def create
    gossip = Gossip.find(params[:gossip_id])
    gossip.likes.create(user: current_user)
    redirect_to gossip_path(gossip)
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy if like.user == current_user
    redirect_to gossip_path(like.gossip)
  end
end
