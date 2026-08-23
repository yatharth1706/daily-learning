#!lua name=ratelimiter

local function check(keys, args)
    local rate_limiter_key = keys[1]
    local window_size = tonumber(args[1])
    local limit  = tonumber(args[2])
    local request_time = tonumber(args[3])
    local request_id = args[4]

    -- calculate window start time
    local window_start_time = request_time - window_size

    -- delete all the older requests before window start time
    redis.call('ZREMRANGEBYSCORE', rate_limiter_key, 0, window_start_time)

    -- check if number of requests present in current window >= limit reject it
    local requests_present_in_window = redis.call('ZCARD', rate_limiter_key)

    if requests_present_in_window >= limit then
        -- allowed or not boolean and number of requests allowed
        return {0,0}
    end

    -- else add it in your window and move forward 
    redis.call('ZADD', rate_limiter_key, request_time, request_id)

    redis.call('PEXPIRE', rate_limiter_key, window_size)

    return {1, limit - requests_present_in_window - 1}
end

redis.register_function('rate_limiter_check', check)