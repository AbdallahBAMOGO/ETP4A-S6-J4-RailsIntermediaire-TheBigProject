class CommentsController < ApplicationController
  def create
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.new(comment_params)
    @comment.user = User.first # Remplacer par l'utilisateur actuel

    if @comment.save
      redirect_to @gossip, notice: 'Commentaire ajouté avec succès.'
    else
      redirect_to @gossip, alert: 'Erreur lors de l\'ajout du commentaire.'
    end
  end

  def edit
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @gossip, notice: 'Commentaire mis à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:gossip_id])
    @comment = @gossip.comments.find(params[:id])
    @comment.destroy
    redirect_to '/gossips', notice: 'Commentaire supprimé avec succès.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
