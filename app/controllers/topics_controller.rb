class TopicsController < ApplicationController
  respond_to :json
    
  def create
    @discipline = Discipline.find(params[:discipline_id])
    @topic = @discipline.topics.create(:description => params[:description],:keywords => params[:keywords], :posts => params[:posts])
    puts "Created new topic " << @topic.description
    respond_with(@topic)
  end
  
  def update
    @topic = findTopic(params[:discipline_id], params[:id])
    
    unless @topic.nil?
      puts "topic not nil"
      @topic.update_attributes(:description => params[:description], :keywords => params[:keywords])
      respond_with(@topic)      
    end    
  end
  
  def destroy
    @topic = findTopic(params[:discipline_id], params[:id])

    unless @topic.nil?
      @topic.destroy
      render(:nothing => true, :status => :ok)
    end
  end
end
