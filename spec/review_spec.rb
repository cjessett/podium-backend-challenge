require 'review'

describe Review do
  
  before :each do
    @rating = 4.6
    @author = "Pickle Rick"
    @title  = "Great dealer"
    @body   = "The greatest review ever."
    @length = @body.length
    params  = { rating: @rating, author: @author, title: @title, body: @body }
    @review = Review.new(params)
  end
  
  describe "#new" do
    it "returns a new Review instance" do
      expect(@review).to be_an_instance_of Review
    end
  end
  
  describe "#rating" do
    it "returns the rating of the review" do
      expect(@review.rating).to eq @rating
    end
  end
  
  describe "#author" do
    it "returns the author of the review" do
      expect(@review.author).to eq @author
    end
  end
  
  describe "#title" do
    it "returns the title of the review" do
      expect(@review.title).to eq @title
    end
  end
  
  describe "#body" do
    it "returns the body of the review" do
      expect(@review.body).to eq @body
    end
  end
  
  describe "#length" do
    it "returns the length of the review" do
      expect(@review.length).to eq @length
    end
  end
  
  describe "#to_s" do
    it "prints the review nicely" do
      review_string = <<-REVIEW
    (#{@rating}) "#{@title}" -- #{@author}
    
    #{@body}
    
    
    REVIEW
    expect(@review.to_s).to eq review_string
    end
  end
end
