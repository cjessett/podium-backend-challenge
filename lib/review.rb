class Review
  attr_reader :author, :rating, :title, :body
  
  def initialize(author:, rating:, title:, body:)
    @author = author
    @rating = rating
    @title  = title
    @body   = body
  end
  
  def length
    body.length
  end
  
  def to_s
    <<-REVIEW
    (#{rating}) "#{title}" -- #{author}
    
    #{body}
    
    
    REVIEW
  end
end