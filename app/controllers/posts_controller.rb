class PostsController < ApplicationController
    respond_to :json
    
    def create
      @discipline = Discipline.find(params[:discipline_id])
      @topic = findTopic(params[:discipline_id], params[:topic_id])

      unless @topic.nil?
        @post = Post.new :title => params[:title], :article => params[:article], :creator => params[:creator], :date_created => params[:date_created]
        @topic.posts << @post
        @discipline.save
      end
      
      respond_with(@discipline)
    end
    
    def update
      @discipline = Discipline.find(params[:discipline_id])
      
      @post = findPost(params[:discipline_id], params[:topic_id], params[:id])      
      unless @post.nil?
        @post.update_attributes(:title => params[:title], :article => params[:article], :creator => params[:creator], :date_created => params[:date_created])
      end

      respond_with(@discipline)
    end
    
    def destroy
      @post = findPost(params[:discipline_id], params[:topic_id], params[:id])
      
      unless @post.nil?
        @post.destroy
        render(:nothing => true, :status => :ok)
      end
    end
end
