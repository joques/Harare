class CitationsController < ApplicationController
  respond_to :json
  
  def create
    @citation = nil
    @post = findPost(params[:discipline_id], params[:topic_id], params[:post_id])
    
    unless @post.nil?
      @citation = @post.citations.create!(params[:citation])
    end
    
    respond_with(@citation)
  end
  
  def update
    @citation = findCitation(params[:discipline_id], params[:topic_id], params[:post_id], params[:id])
    
    unless @citation.nil?
      @citation.resource_title = params[:resource_title]
      @citation.resource_type = params[:resource_type]
      @citation.date_of_publication = params[:date_of_publication]
      @citation.authors = params[:authors]
      @citation.save!
    end
    
    respond_with(@citation)
  end
  
  def destroy
    @citation = findCitation(params[:discipline_id], params[:topic_id], params[:post_id], params[:id])
    
    unless @citation.nil?
      @citation.destroy!
      render(:nothing => true, :status => :ok)
    end
  end
end
