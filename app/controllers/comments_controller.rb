# frozen_string_literal: true

class CommentsController < ApplicationController
  load_and_authorize_resource

  # POST /articles/:article_id/comments
  def create
    @article = Article.find_by(sequence_num: params[:article_id])
    @comment = @article.comments.build(comment_params)
    @comment.user_id = User.current_user.id
    @comment.save!
    redirect_to article_path(@article)
  end

  # DELETE /articles/:article_id/comments/:id
  def destroy
    @article = Article.find_by(sequence_num: params[:article_id])
    @comment = @article.comments.find(params[:id])

    @comment.destroy
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
