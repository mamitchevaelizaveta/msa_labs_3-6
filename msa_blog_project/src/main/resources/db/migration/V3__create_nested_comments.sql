ALTER TABLE comments
ADD COLUMN parent_id BIGINT NULL,
ADD CONSTRAINT fk_comments_parent FOREIGN KEY (parent_id) REFERENCES comments(id) ON DELETE CASCADE;