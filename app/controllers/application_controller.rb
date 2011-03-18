class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  #find a topic embedded in a given discipline
  def findTopic(discipline_id, topic_id)
    @topic = nil
    
    @discipline = Discipline.find(discipline_id)
    @discipline.topics.each do |topic|
      if topic.guid == topic_id then
        @topic = topic
        break
      end
    end
    
    return @topic
  end
  
  # find a post embedded in a topic, which itself is embedded in a discipline
  def findPost(discipline_id, topic_id, post_id)
    @post = nil

    @topic = findTopic(discipline_id, topic_id)
    unless @topic.nil?
      @topic.posts.each do |post|
        if post.guid == post_id then
          @post = post
          break
        end
      end
    end
    
    return @post
  end
  
  # find a comment in a discipline/topic/post
  def findComment(discipline_id, topic_id, post_id, comment_id)
    @comment = nil
    @post = findPost(discipline_id, topic_id, post_id)
    
    unless @post.nil?
      @post.comments.each do |comment|
        if comment.guid == comment_id then
          @comment = comment
          break
        end
      end
    end
    
    return @comment
  end
  
  # find a citation in discipline/topic/post
  def findCitation(discipline_id, topic_id, post_id, citation_id)
    @citation = nil
    @post = findPost(discipline_id, topic_id, post_id)
    
    unless @post.nil?
      @post.citations.each do |citation|
        if citation.guid == citation_id then
          @citation = citation
          break
        end
      end
    end
    
    return @citation
  end
  
  # find an author in discipline/topic/post/citation
  def findAuthor(discipline_id, topic_id, post_id, citation_id, author_id)
    @author = nil
    @citation = findCitation(discipline_id, topic_id, post_id, citation_id)
    
    unless @citation.nil?
      @citation.authors.each do |author|
        if author.guid == author_id then
          @author = author
          break
        end
      end
    end
    
    return @author
  end
end
