require 'nokogiri'
require 'open-uri'
require_relative 'lib/review'

BASE_URL        = "https://www.dealerrater.com/dealer"
MCKAIG_PATH     = "McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685"
POSITIVE_FILTER = "ONLY_POSITIVE"
USER_AGENT      = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0) Gecko/20100101 Firefox/67.0"
PAGES           = 5

REVIEWS_SELECTOR = "div.review-entry"
RATING_SELECTOR  = "div.rating-static"
AUTHOR_SELECTOR  = "span.italic.font-18.black.notranslate"
TITLE_SELECTOR   = "h3.no-format.inline.italic-bolder.font-20.dark-grey"
BODY_SELECTOR    = "p.review-content"
REVIEWS_TO_FIND  = 3

# Finds and parses the rating from the list of css classes
# from the rating element
def get_rating(classes)
  rating_string = classes.find { |css_class| css_class.match(/rating-\d\d/) }
  rating_num    = rating_string.split("-")[-1]
  rating_num.to_f / 10
end

# Displays the top REVIEWS_TO_FIND reviews
def display(reviews)
  puts "\n\nTop #{REVIEWS_TO_FIND} Overly Positive Endorsements of McKaig Chevrolet Buick\n\n"

  reviews.each_with_index do |review, idx|
    puts "#{idx + 1}. #{review}"
  end
end

reviews = []

# collect the reviews from each page
for page in 1..PAGES do
  url = "#{BASE_URL}/#{MCKAIG_PATH}/page#{page}?filter=#{POSITIVE_FILTER}"
  doc = Nokogiri::HTML(open(url, "User-Agent" => USER_AGENT))
  
  doc.css(REVIEWS_SELECTOR).collect do |review|
    params = Hash.new
    
    params[:rating] = get_rating(review.css(RATING_SELECTOR).first.classes)
    params[:author] = review.css(AUTHOR_SELECTOR).text.gsub("- ", "")
    params[:title]  = review.css(TITLE_SELECTOR).text.gsub("\"", "")
    params[:body]   = review.css(BODY_SELECTOR).text
    
    reviews << Review.new(params)
  end
end

# sort the reviews by rating then length and display the top REVIEWS_TO_FIND
sorted_reviews = reviews.sort_by { |r| [r.rating, r.length] }
top_offenders  = sorted_reviews.last(REVIEWS_TO_FIND).reverse

display(top_offenders)
