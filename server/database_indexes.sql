-- QuickAI Database Performance Optimization
-- Database Indexes for Better Query Performance

-- =====================================================
-- PRIMARY INDEXES FOR MOST COMMON QUERIES
-- =====================================================

-- 1. Index for user-specific queries (most common)
-- Speeds up: SELECT * FROM creations WHERE user_id = ?
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_creations_user_id 
ON creations(user_id);

-- 2. Index for content type filtering
-- Speeds up: SELECT * FROM creations WHERE type = ?
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_creations_type 
ON creations(type);

-- 3. Index for published content queries
-- Speeds up: SELECT * FROM creations WHERE publish = true
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_creations_publish 
ON creations(publish);

-- 4. Index for creation timestamps (for ORDER BY)
-- Speeds up: ORDER BY created_at DESC
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_creations_created_at 
ON creations(created_at DESC);

-- =====================================================
-- COMPOUND INDEXES FOR COMPLEX QUERIES
-- =====================================================

-- 5. User + Type combination (very common)
-- Speeds up: SELECT * FROM creations WHERE user_id = ? AND type = ?
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_creations_user_type 
ON creations(user_id, type);

-- 6. User + Publish combination
-- Speeds up: SELECT * FROM creations WHERE user_id = ? AND publish = ?
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_creations_user_publish 
ON creations(user_id, publish);

-- 7. Type + Publish + created_at (for public galleries)
-- Speeds up: SELECT * FROM creations WHERE type = ? AND publish = true ORDER BY created_at DESC
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_creations_type_publish_date 
ON creations(type, publish, created_at DESC);

-- 8. User + created_at (for user dashboard)
-- Speeds up: SELECT * FROM creations WHERE user_id = ? ORDER BY created_at DESC
CREATE INDEX CONCURRENTLY IF NOT EXISTS idx_creations_user_date 
ON creations(user_id, created_at DESC);

-- =====================================================
-- PERFORMANCE VERIFICATION QUERIES
-- =====================================================

-- Check if indexes were created successfully
SELECT 
    indexname, 
    indexdef 
FROM pg_indexes 
WHERE tablename = 'creations' 
ORDER BY indexname;

-- Analyze table statistics after indexing
ANALYZE creations;

-- =====================================================
-- QUERY PERFORMANCE TESTING
-- =====================================================

-- Test queries with EXPLAIN ANALYZE to see performance improvement
-- Uncomment these to test performance:

-- EXPLAIN ANALYZE SELECT * FROM creations WHERE user_id = 'test_user_id';
-- EXPLAIN ANALYZE SELECT * FROM creations WHERE type = 'article';
-- EXPLAIN ANALYZE SELECT * FROM creations WHERE publish = true ORDER BY created_at DESC;
-- EXPLAIN ANALYZE SELECT * FROM creations WHERE user_id = 'test_user_id' AND type = 'image';

-- =====================================================
-- INDEX MAINTENANCE COMMANDS
-- =====================================================

-- To drop indexes if needed (for testing):
-- DROP INDEX IF EXISTS idx_creations_user_id;
-- DROP INDEX IF EXISTS idx_creations_type;
-- DROP INDEX IF EXISTS idx_creations_publish;
-- DROP INDEX IF EXISTS idx_creations_created_at;
-- DROP INDEX IF EXISTS idx_creations_user_type;
-- DROP INDEX IF EXISTS idx_creations_user_publish;
-- DROP INDEX IF EXISTS idx_creations_type_publish_date;
-- DROP INDEX IF EXISTS idx_creations_user_date;

-- =====================================================
-- PERFORMANCE IMPACT SUMMARY
-- =====================================================

/*
Expected Performance Improvements:

1. User Dashboard Queries: 50-100ms → 1-5ms (95-99% faster)
2. Public Gallery Queries: 100-200ms → 5-10ms (90-95% faster)  
3. Type Filtering: 30-60ms → 1-3ms (95-98% faster)
4. User + Type Queries: 80-150ms → 2-5ms (95-97% faster)

These indexes will automatically maintain themselves and 
significantly improve performance as your data grows.
*/