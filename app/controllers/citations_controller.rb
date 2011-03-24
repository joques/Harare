class CitationsController < ApplicationController
  respond_to :json
  
  def create
    @discipline = Discipline.find(params[:discipline_id])
    @post = findPost(params[:discipline_id], params[:topic_id], params[:post_id])

    unless @post.nil?
      @citation = Citation.new :resource_title => params[:resource_title],:resource_type => params[:resource_type], :date_of_publication => params[:date_of_publication]
      @post.citations << @citation
      @discipline.save
    end
    
    respond_with(@discipline)
  end
  
  def update
    @discipline = Discipline.find(params[:discipline_id])
    @citation = findCitation(params[:discipline_id], params[:topic_id], params[:post_id], params[:id])
    
    unless @citation.nil?
      @citation.update_attributes(:resource_title => params[:resource_title], :resource_type => params[:resource_type], 
      :date_of_publication => params[:date_of_publication])
    end

    respond_with(@discipline)    
  end
  
  def destroy
    @citation = findCitation(params[:discipline_id], params[:topic_id], params[:post_id], params[:id])
    
    unless @citation.nil?
      @citation.destroy
      render(:nothing => true, :status => :ok)
    end
  end
end
