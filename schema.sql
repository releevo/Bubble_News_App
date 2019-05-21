create database bubble_news_app;

create table users(
    id SERIAL PRIMARY KEY,
    display_name VARCHAR(500) NOT NULL,
    email VARCHAR(500) NOT NULL,
    password_digest VARCHAR(500) NOT NULL
);

create table topics(
    id SERIAL PRIMARY KEY,
    name VARCHAR(500) NOT NULL,
    user_id INTEGER,
    article_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

create table stories(
    id SERIAL PRIMARY KEY,
    title VARCHAR(500),
    creator_id INTEGER,
    FOREIGN KEY (creator_id) REFERENCES users (id) ON DELETE CASCADE
);

create table stories_articles(
    id SERIAL PRIMARY KEY,
    article_id INTEGER,
    story_id INTEGER,
    contributor_id INTEGER,
    original_side BOOLEAN
);

create table stories_topics(
    id SERIAL PRIMARY KEY,
    topic_id INTEGER,
    story_id INTEGER
);

create table articles(
    id SERIAL PRIMARY KEY,
    title VARCHAR(500),
    article_url TEXT,
    article_description TEXT,
    image_url TEXT,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

create table discussions(
    id SERIAL PRIMARY KEY,
    content TEXT,
    user_id INTEGER,
    story_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (story_id) REFERENCES stories (id) ON DELETE CASCADE
);

create table votes(
    id SERIAL PRIMARY KEY,
    number INTEGER,
    user_id INTEGER,
    article_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (article_id) REFERENCES articles (id) ON DELETE CASCADE
);

create table notifications(
    id SERIAL PRIMARY KEY,
    creator_id INTEGER,
    contributor_id INTEGER,
    story_id INTEGER,
    notification_type VARCHAR(500),
    seen BOOLEAN,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);
