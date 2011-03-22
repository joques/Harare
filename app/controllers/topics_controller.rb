class TopicsController < ApplicationController
  respond_to :json
    
  def create
    @discipline = Discipline.find(params[:discipline_id])
    @topic = @discipline.topics.create(params[:topic])
    respond_with(@topic)
  end
  
  def update
    @topic = findTopic(params[:discipline_id], params[:id])
    
    unless @topic.nil?
      @topic.description = params[:description]
      @topic.keywords = params[:keywords]
      @topic.posts = params[:posts]
      @topic.save!
      respond_with(@topic)      
    end  
  end
  
  def destroy
    @topic = findTopic(params[:discipline_id], params[:id])

    unless @topic.nil?
      @topic.destroy!
      render(:nothing => true, :status => :ok)
    end
  end
end
