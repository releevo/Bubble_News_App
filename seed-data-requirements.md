# Seed Data Requirements

## Topics/Stories

Must be seeded before users.

At least 1 story for each topic - need to show on homepage.
At least 2 topics have more than 2 stories.

## Users/Notifications

name@test.com PW: 123

At least 3 users, each interested in EVERY topic.
Make sure users have avatars.


## Articles

Some stories have 1 article, some have 2.


## Votes

For the 2 topics being demoed, each has a story with highest vote count.

## Issues

- [ ] Once a crashing OpenURI story is added to the db, clicking on the notification to add perspective also crashes. IF HAPPENS DURING DEMO EXPLAIN WHY.

- [ ] stories_topics should cascade delete when story is deleted, otherwise nav topics stop working because the story cannot be found.

- Should article CASCADE DELETE on story? stories_articles does not cascade

- [ ] Sign Up - Economy topic spelled wrong
- [ ] signup.rb crashed at Line 15 
- [ ] Google News only works once when adding story

## Improvement

- Two topics could be showing the same top story if that story has the highest vote in both topics.
- Guest should see 'no comments' when there are no comments on a story.

## UX

Add Story - Article search query should defualt to story title.
