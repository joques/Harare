class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
  
  #find a topic embedded in a given discipline
  def findTopic(discipline_id, topic_id)
    @discipline = Discipline.find(discipline_id)
    @topic = @discipline.topics.find(topic_id)
  end
  
  # find a post embedded in a topic, which itself is embedded in a discipline
  def findPost(discipline_id, topic_id, post_id)
    @topic = findTopic(discipline_id, topic_id)
    @post = @topic.posts.find(post_id)
  end
  
  # find a comment in a discipline/topic/post
  def findComment(discipline_id, topic_id, post_id, comment_id)
    @post = findPost(discipline_id, topic_id, post_id)
    @comment = @post.comments.find(comment_id)
  end
  
  # find a citation in discipline/topic/post
  def findCitation(discipline_id, topic_id, post_id, citation_id)
    @post = findPost(discipline_id, topic_id, post_id)
    @citation = @post.citations.find(citation_id)
  end
  
  # find an author in discipline/topic/post/citation
  def findAuthor(discipline_id, topic_id, post_id, citation_id, author_id)
    @citation = findCitation(discipline_id, topic_id, post_id, citation_id)
    @author = @citation.authors.find(author_id)
  end
end
