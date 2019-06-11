require 'review'

describe Review do
  
  describe "#new" do
    it "returns a new Review instance" do
      review = Review.new
      expect(review).to be_an_instance_of Review
    end
  end

end