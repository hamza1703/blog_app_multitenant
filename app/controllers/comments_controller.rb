# frozen_string_literal: true

class CommentsController < ApplicationController
  load_and_authorize_resource :article, find_by: :sequence_num
  load_and_authorize_resource :comment, through: :article

  # POST /articles/:article_id/comments
  def create
    @comment.user_id = User.current_user.id
    is_successful = @comment.save
    respond_to do |format|
      format.html do
        if is_successful
          redirect_to article_path(@article)
        end
      end
    end
  end

  # DELETE /articles/:article_id/comments/:id
  def destroy
    @comment.destroy
    is_destroyed = @comment.destroyed?
    respond_to do |format|
      format.html do
        if is_destroyed
          redirect_to article_path(@article)
        end
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
