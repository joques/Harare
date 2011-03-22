class AuthorsController < ApplicationController
  respond_to :json
  
  def create
    @author = nil
    @citation = findCitation(params[:discipline_id], params[:topic_id], params[:post_id], params[:citation_id])
    
    unless @citation.nil?
      @author = @citation.authors.create(:first_name => params[:first_name], 
      :last_name => params[:last_name], :email => params[:email])
    end
    
    respond_with(@author)
  end
  
  def update
    @author = findAuthor(params[:discipline_id], params[:topic_id], params[:post_id], params[:citation_id], params[:id])
    
    unless @author.nil?
      @author.update_attributes(:first_name => params[:first_name], 
      :last_name => params[:last_name], :email => params[:email])
    end
    
    respond_with(@author)
  end
  
  def destroy
    @author = findAuthor(params[:discipline_id], params[:topic_id], params[:post_id], params[:citation_id], params[:id])    
    
    unless @author.nil?
      @author.destroy
      render(:nothing => true, :status => :ok)
    end
  end
end
