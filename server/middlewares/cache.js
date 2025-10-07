import NodeCache from 'node-cache';

// Cache for 1 hour (3600 seconds)
const cache = new NodeCache({ stdTTL: 3600 });

export const cacheMiddleware = (req, res, next) => {
  // Create cache key from prompt (for article generation)
  const cacheKey = `article:${Buffer.from(req.body.prompt).toString('base64').slice(0, 50)}`;

  // Check if cached response exists
  const cachedResult = cache.get(cacheKey);

  if (cachedResult) {
    console.log(`Cache HIT for: ${cacheKey}`);
    return res.json({
      success: true,
      content: cachedResult,
      cached: true,
      message: 'Retrieved from cache',
    });
  }

  console.log(`Cache MISS for: ${cacheKey}`);

  // Store original res.json
  const originalJson = res.json;

  // Override res.json to cache successful responses
  res.json = function (data) {
    if (data.success && data.content) {
      cache.set(cacheKey, data.content);
      console.log(`Cached response for: ${cacheKey}`);
    }
    return originalJson.call(this, data);
  };

  next();
};

export default cache;
