class AuthorsController < ApplicationController
  respond_to :json
  
  def create
    @discipline = Discipline.find(params[:discipline_id])
    @citation = findCitation(params[:discipline_id], params[:topic_id], params[:post_id], params[:citation_id])

    unless @post.nil?
      @author = Author.new :first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email]
      @citation.authors << @author
      @discipline.save
    end
    
    respond_with(@discipline)
  end
  
  def update
    
    @discipline = Discipline.find(params[:discipline_id])
    @author = findAuthor(params[:discipline_id], params[:topic_id], params[:post_id], params[:citation_id], params[:id])
    
    unless @author.nil?
      @author.update_attributes(:first_name => params[:first_name], :last_name => params[:last_name], :email => params[:email])
    end

    respond_with(@discipline)
  end
  
  def destroy
    @author = findAuthor(params[:discipline_id], params[:topic_id], params[:post_id], params[:citation_id], params[:id])    
    
    unless @author.nil?
      @author.destroy
      render(:nothing => true, :status => :ok)
    end
  end
end
