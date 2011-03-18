class CommentsController < ApplicationController
  respond_to :json
  
  def create
    @comment = nil
    @post = findPost(params[:discipline_id], params[:topic_id], params[:post_id])
    
    unless @post.nil?
      @comment = @post.comments.create!(params[:comment])
    end
    
    respond_with(@comment)
  end
  
  def update
    @comment = findComment(params[:discipline_id], params[:topic_id], params[:post_id], params[:id])
    
    unless @comment.nil?
      @comment.comment = params[:comment]
      @comment.commentator = params[:commentator]
      @comment.date_created = params[:date_created]
      @comment.save!
    end
    
    respond_with(@comment)
  end
  
  def destroy
    @comment = findComment(params[:discipline_id], params[:topic_id], params[:post_id], params[:id])
    
    unless @comment.nil?
      @comment.destroy!
      render(:nothing => true, :status => :ok)
    end
  end
end
