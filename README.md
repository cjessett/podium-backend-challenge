# Backend Coding Assessment

This script scrapes the first 5 pages of **positive** reviews of McKaig Chevrolet Buick found on DealerRater.com and displays the top 3 "overly positive" results.

Criteria for determining the top 3 "overly postive" reviews:
 - Uses the `ONLY POSITIVE` filter available on the site
 - Review rating (higher -> more positive)
 - Length of the review (longer -> more positive)

### Install dependencies

```
bundle install
```

### Display the top 3 overly positive reviews

```
ruby scrape_reviews.rb
```

#### Run tests
```
rake
```

## Requirements

We really look for three things when it comes to the coding challenge: 

- 1 You follow good engineering practices
- 2 Your code is well tested and documented
- 3 You show thoughtful code organization

You can use any language you choose just be sure you include execution instructions, etc. Let me know if you have any questions.

##### Coding Challenge: “A Dealer For the People”

The KGB has noticed a resurgence of overly excited reviews for a McKaig Chevrolet Buick, a dealership they have planted in the United States. In order to avoid attracting unwanted attention, you’ve been enlisted to scrape reviews for this dealership from DealerRater.com and uncover the top three worst offenders of these overly positive endorsements.

Your mission, should you choose to accept it, is to write a tool that:

- 1 scrapes the first five pages of reviews
- 2 identifies the top three most “overly positive” endorsements (using criteria of your choosing, documented in the README)
- 3 outputs these three reviews to the console, in order of severity

Please include documentation on how to run your application along with how to run the test suite.
