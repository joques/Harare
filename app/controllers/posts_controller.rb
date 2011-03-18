class PostsController < ApplicationController
    respond_to :json
    
    def create
      @topic = findTopic(params[:discipline_id], params[:topic_id])
      @post = nil      
      
      unless @topic.nil?
        @post = @topic.posts.create!(params[:post])
      end
      
      respond_with(@post)
    end
    
    def update
      @post = findPost(params[:discipline_id], params[:topic_id], params[:id])
      
      unless @post.nil?
        @post.title = params[:title]
        @post.article = params[:article]
        @post.creator = params[:creator]
        @post.date_created = params[:date_created]
        @post.comments = params[:comments]
        @post.citations = params[:citations]
        @post.save!          
      end

      respond_with(@post)
    end
    
    def destroy
      @post = findPost(params[:discipline_id], params[:topic_id], params[:id])
      
      unless @post.nil?
        @post.destroy!
        render(:nothing => true, :status => :ok)
      end
    end
end
