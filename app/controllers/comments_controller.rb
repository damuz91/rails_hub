class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :authorize_comment, only: [:destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.video_id = params[:video_id]
    if @comment.save
      redirect_to video_path(@comment.video_id), notice: "Comentario creado exitosamente."
    else
      redirect_to video_path(@comment.video_id), alert: "No se pudo crear el comentario. #{@comment.errors.full_messages.to_sentence}"
    end
  end

  def destroy
    @comment.destroy
    redirect_to video_path(@comment.video), notice: "Comentario eliminado exitosamente."
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_comment
    unless @comment.user == current_user
      redirect_to video_path(@comment.video), alert: "No tienes permiso para eliminar este comentario."
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
