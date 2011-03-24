class TopicsController < ApplicationController
  respond_to :json
    
  def create
    @discipline = Discipline.find(params[:discipline_id])
    @topic = Topic.new :description => params[:description], :Keywords => params[:keywords]
    @discipline.topics << @topic
    @discipline.save
            
    respond_with(@discipline)
  end
  
  def update
    @discipline = Discipline.find(params[:discipline_id])
    
    @topic = findTopic(params[:discipline_id], params[:id])    
    unless @topic.nil?
      @topic.update_attributes(:description => params[:description], :keywords => params[:keywords])
    end

    respond_with(@discipline)          
  end
  
  def destroy
    @topic = findTopic(params[:discipline_id], params[:id])

    unless @topic.nil?
      @topic.destroy
      render(:nothing => true, :status => :ok)
    end
  end
end