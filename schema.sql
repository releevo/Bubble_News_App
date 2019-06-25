create database bubbles;

create table users(
    id SERIAL PRIMARY KEY,
    display_name VARCHAR(500) NOT NULL,
    avatar TEXT,
    email VARCHAR(500) NOT NULL,
    password_digest VARCHAR(500) NOT NULL
);

create table users_topics (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    topic_id INTEGER NOT NULL
);

create table topics(
    id SERIAL PRIMARY KEY,
    name VARCHAR(500) NOT NULL
);

create table stories(
    id SERIAL PRIMARY KEY,
    title VARCHAR(500),
    creator_id INTEGER,
    time_created TIMESTAMP,
    FOREIGN KEY (creator_id) REFERENCES users (id) ON DELETE CASCADE
);

create table stories_articles(
    id SERIAL PRIMARY KEY,
    story_id INTEGER,
    article_id INTEGER
    -- contributor_id INTEGER --NECESSARY FOR TRAVERSING?
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
    original_side BOOLEAN,
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
);

create table comments(
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    user_id INTEGER,
    story_id INTEGER,
    time_created TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (story_id) REFERENCES stories (id) ON DELETE CASCADE
);

create table votes(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    article_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (article_id) REFERENCES articles (id) ON DELETE CASCADE
);

create table notifications(
    id SERIAL PRIMARY KEY,
    sender_id INTEGER,
    receiver_id INTEGER,
    story_id INTEGER,
    notification_type VARCHAR(500),
    seen BOOLEAN,
    time_created TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES users (id) ON DELETE CASCADE,
    FOREIGN KEY (story_id) REFERENCES stories (id) ON DELETE CASCADE
);