class CommentsController < ApplicationController
  respond_to :json
  
  def create
    @comment = nil
    @post = findPost(params[:discipline_id], params[:topic_id], params[:post_id])
    
    unless @post.nil?
      @comment = @post.comments.create(:comment => params[:comment], :commentator => params[:commentator], :date_created => params[:date_created])
    end
    
    respond_with(@comment)
  end
  
  def update
    @comment = findComment(params[:discipline_id], params[:topic_id], params[:post_id], params[:id])
    
    unless @comment.nil?
      @comment.update_attributes(:comment => params[:comment], :commentator => params[:commentator], :date_created => params[:date_created])
    end
    
    respond_with(@comment)
  end
  
  def destroy
    @comment = findComment(params[:discipline_id], params[:topic_id], params[:post_id], params[:id])
    
    unless @comment.nil?
      @comment.destroy
      render(:nothing => true, :status => :ok)
    end
  end
end
