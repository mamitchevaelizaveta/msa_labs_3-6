-- Связь многие-ко-многим
CREATE TABLE article_tags (
    article_id BIGINT NOT NULL,
    tag_id BIGINT NOT NULL,
    PRIMARY KEY (article_id, tag_id),
    CONSTRAINT fk_article_tags_article FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,
    CONSTRAINT fk_article_tags_tag FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE
);

-- Индексы по тегам и датам
CREATE INDEX idx_articles_created_at ON articles(created_at);
CREATE INDEX idx_articles_published_at ON articles(published_at);
CREATE INDEX idx_article_tags_tag_id ON article_tags(tag_id);
CREATE INDEX idx_comments_article_id ON comments(article_id);
CREATE INDEX idx_reactions_article_id ON reactions(article_id);