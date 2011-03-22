class PostsController < ApplicationController
    respond_to :json
    
    def create
      @topic = findTopic(params[:discipline_id], params[:topic_id])
      @post = nil      
      
      unless @topic.nil?
        @post = @topic.posts.create(:title => params[:title], :article => params[:article], :creator => params[:creator], 
        :date_created => params[:date_created], :citations => params[:citations], :comments => params[:comments])
      end
      
      respond_with(@post)
    end
    
    def update
      @post = findPost(params[:discipline_id], params[:topic_id], params[:id])
      
      unless @post.nil?
        @post.update_attributes(:title => params[:title], :article => params[:article], :creator => params[:creator],
        :date_created => params[:date_created])
      end

      respond_with(@post)
    end
    
    def destroy
      @post = findPost(params[:discipline_id], params[:topic_id], params[:id])
      
      unless @post.nil?
        @post.destroy
        render(:nothing => true, :status => :ok)
      end
    end
end
