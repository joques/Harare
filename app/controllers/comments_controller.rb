class CommentsController < ApplicationController
  respond_to :json
  
  def create
    @discipline = Discipline.find(params[:discipline_id])
    @post = findPost(params[:discipline_id], params[:topic_id], params[:post_id])

    unless @post.nil?
      @comment = Comment.new :comment => params[:comment], :commentator => params[:commentator], :date_created => params[:date_created]
      @post.comments << @comment
      @discipline.save
    end
    
    respond_with(@discipline)    
  end
  
  def update
    @discipline = Discipline.find(params[:discipline_id])
    @comment = findComment(params[:discipline_id], params[:topic_id], params[:post_id], params[:id])    
    
    unless @comment.nil?
      @comment.update_attributes(:comment => params[:comment], :commentator => params[:commentator], :date_created => params[:date_created])      
    end

    respond_with(@discipline)    
  end
  
  def destroy
    @comment = findComment(params[:discipline_id], params[:topic_id], params[:post_id], params[:id])
    
    unless @comment.nil?
      @comment.destroy
      render(:nothing => true, :status => :ok)
    end
  end
end
