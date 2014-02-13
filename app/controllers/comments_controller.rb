class CommentsController < ApplicationController
  def show
    if not flash[:new_comment]
        @new_comment = Comment.new
        @new_comment.hackerino_id = params[:id]
    else
        @new_comment = flash[:new_comment]
    end
    @hackerino = Hackerino.find(params[:id])
    @comments = @hackerino.comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
        redirect_to '/comments/' << comment_params[:hackerino_id].to_s
    else
        redirect_to '/comments/' << comment_params[:hackerino_id].to_s, :flash => { :new_comment => @comment}
    end
  end

  private
    def comment_params
        params.require(:comment).permit(:author, :content, :hackerino_id)
    end
end
