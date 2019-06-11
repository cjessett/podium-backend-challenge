require 'nokogiri'
require 'open-uri'

BASE_URL = "https://www.dealerrater.com/dealer"
MCKAIG_PATH = "McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685"
POSITIVE_FILTER = "ONLY_POSITIVE"
LAST_PAGE = 5
USER_AGENT = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0) Gecko/20100101 Firefox/67.0"
RATING_PATTERN = /rating-\d\d/

def get_rating(classes)
  rating_string = classes.find { |css_class| css_class.match(RATING_PATTERN) }
  rating_num = rating_string.split("-")[-1]
  return rating_num.to_f / 10
end

reviews = []

for page in 1..LAST_PAGE do
  url = "#{BASE_URL}/#{MCKAIG_PATH}/page#{page}?filter=#{POSITIVE_FILTER}"
  doc = Nokogiri::HTML(open(url, "User-Agent" => USER_AGENT))
  
  doc.css("div.review-entry").collect do |review|
    rating = get_rating(review.css("div.rating-static").first.classes)
    author = review.css("span.italic.font-18.black.notranslate").text.gsub("- ", "")
    title  = review.css("h3.no-format.inline.italic-bolder.font-20.dark-grey").text.gsub("\"", "")
    body   = review.css("p.review-content").text
    reviews << { rating: rating, author: author, title: title, body: body }
  end
end

puts reviews
