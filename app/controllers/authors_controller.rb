class AuthorsController < ApplicationController
  respond_to :json
  
  def create
    @author = nil
    @citation = findCitation(params[:discipline_id], params[:topic_id], params[:post_id], params[:citation_id])
    
    unless @citation.nil?
      @author = @citation.authors.create!(params[:author])
    end
    
    respond_with(@author)
  end
  
  def update
    @author = findAuthor(params[:discipline_id], params[:topic_id], params[:post_id], params[:citation_id], params[:id])
    
    unless @author.nil?
      @author.first_name = params[:first_name]
      @author.last = params[:last_name]
      @author.email = params[:email]
      @author.save!
    end
    
    respond_with(@author)
  end
  
  def destroy
    @author = findAuthor(params[:discipline_id], params[:topic_id], params[:post_id], params[:citation_id], params[:id])    
    
    unless @author.nil?
      @author.destroy!
      render(:nothing => true, :status => :ok)
    end
  end
end
