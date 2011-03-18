class TopicsController < ApplicationController
  respond_to :json
    
  def create
    @discipline = Discipline.find(params[:discipline_id])
    @topic = @discipline.topics.create!(params[:topic])
    respond_with(@topic)
  end
  
  def update
    @discipline = Discipline.find(params[:discipline_id])
    @topic = nil
    
    @discipline.topics.each do |topic|
      if topic.guid == params[:guid]
        @topic = topic
        break
      end
    end
    
    unless @topic.nil?
      @topic.description = params[:description]
      @topic.keywords = params[:keywords]  
      @topic.save!
      respond_with(@topic)      
    end  
  end
  
  def destroy
    @discipline = Discipline.find(params[:discipline_id])
    @topic = nil
    
    @discipline.topics.each do |topic|
      if topic.guid == params[:guid] then
        @topic = topic
        break
      end
      
      unless @topic.nil?
        @topic.destroy!
        render(:nothing => true, :status => :ok)
      end
    end
  end
end
