-- Add indexes for faster queries
CREATE INDEX IF NOT EXISTS idx_creations_user_id ON creations(user_id);
CREATE INDEX IF NOT EXISTS idx_creations_type ON creations(type);
CREATE INDEX IF NOT EXISTS idx_creations_publish ON creations(publish);
CREATE INDEX IF NOT EXISTS idx_creations_user_type ON creations(user_id, type);
