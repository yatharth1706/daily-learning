local rate_limiter_key = KEYS[1]
local current_time = tonumber(ARGV[1])
local window = tonumber(ARGV[2])
local limit = tonumber(ARGV[3])
local request_id = ARGV[4]

-- calculate the window start time
local window_start_time = current_time - window

-- remove all the entries that are older than the window start time
redis.call('ZREMRANGEBYSCORE', rate_limiter_key, 0, window_start_time)

-- get the number of entries in the window
local existing_request_in_window = redis.call('ZCARD', rate_limiter_key)

-- if the number of entries is greater than or equal to the limit, return false
if existing_request_in_window >= limit then
    return {0,0}
end

-- add the current time as a score to the rate limiter
redis.call('ZADD', rate_limiter_key, current_time, request_id)

-- expire the rate limiter key after the window time
redis.call('PEXPIRE', rate_limiter_key, window)

-- return the number of requests allowed and the number of requests remaining
return {1, limit - existing_request_in_window - 1}