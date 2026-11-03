CREATE TABLE reactions (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    article_id BIGINT NULL,
    comment_id BIGINT NULL,
    reaction_type VARCHAR(20) NOT NULL, -- 'LIKE', 'DISLIKE', 'LOVE' и т.д.
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reactions_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_reactions_article FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE,
    CONSTRAINT fk_reactions_comment FOREIGN KEY (comment_id) REFERENCES comments(id) ON DELETE CASCADE,
    CONSTRAINT chk_reaction_target CHECK (
        (article_id IS NOT NULL AND comment_id IS NULL) OR
        (article_id IS NULL AND comment_id IS NOT NULL)
    )
);