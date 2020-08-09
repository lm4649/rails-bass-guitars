class CommentsController < ApplicationController
  def new
    set_comment
  end

  def create
    @bass = Bass.find(params[:bass_id])
    @comment = Comment.new(comment_params)
    @comment.bass = @bass

    if @comment.save
      redirect_to bass_path(@bass)
    else
      set_comment
      render :new
    end
  end

  private

  def set_comment
    @bass = Bass.find(params[:bass_id])
    @comment = Comment.new
  end

  def comment_params
    params.require(:comment).permit(:content, :rating)
  end
end
