class CommentsController < ApplicationController
  def show
    @new_comment = Comment.new
    @new_comment.hackerino_id = params[:id]
    @hackerino = Hackerino.find(params[:id])
    @comments = @hackerino.comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
        redirect_to '/comments/' << comment_params[:hackerino_id].to_s
    else
        render 'hackerinos#index' #get some error stuff here
    end
  end

  private
    def comment_params
        params.require(:comment).permit(:author, :content, :hackerino_id)
    end
end
