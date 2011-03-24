class TopicsController < ApplicationController
  respond_to :json
    
  def create
    puts "From Topics Controller Create"
    puts "discipline_id = " << params[:discipline_id]
    puts "description = " << params[:description]
    puts "keywords = " << params[:keywords]
    
    @discipline = Discipline.find(params[:discipline_id])
    
    puts "Found discipline " << @discipline.name
    
    
    @discipline.topics.build

    puts "Does it have topics? " << @discipline.topics.nil?

    
    @topic = @discipline.topics.create!(:description => params[:description],:keywords => params[:keywords])
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
