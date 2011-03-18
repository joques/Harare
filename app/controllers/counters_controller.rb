class CountersController < ApplicationController
  respond_to :json
  
  def update
    @counter = CentralId.first
    @counter.discipline_counter = params[:discipline_counter]
    @counter.topic_counter = params[:topic_counter]
    @counter.post_counter = params[:post_counter]
    @counter.comment_counter = params[:comment_counter]
    @counter.citation_counter = params[:citation_counter]
    @counter.author_counter = params[:author_counter]
    
    @counter.save!
    respond_with(@counter)
  end
end
