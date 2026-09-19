# 🚀 Redis Deep Dive — 11-Module Roadmap

A from-beginner-to-senior-staff journey through Redis. One module per day, in full
detail, with diagrams. Each lesson lives under [`redis/`](./redis/).

> **Currently at:** Modules 1 & 3 fully done ✅ · Module 2 → **2.1–2.5 done** ✅ (2.6 Streams + 2.7 specialized types
> parked as bonus chapters) · Module 4 → **4.1 RDB** done ✅
> · next up: **4.2 AOF and fsync policies**

---

## 📚 Progress Tracker

### Module 1 — Foundations: what Redis is and how to talk to it
- [x] 1.1  What is Redis and why it exists → [`redis/module-01-foundations/1.1-what-is-redis.md`](./redis/module-01-foundations/1.1-what-is-redis.md)
- [x] 1.2  Installing & running Redis (Docker, `redis-cli`) → [`redis/module-01-foundations/1.2-installing-and-running.md`](./redis/module-01-foundations/1.2-installing-and-running.md)
- [x] 1.3  The single-threaded mental model → [`redis/module-01-foundations/1.3-single-threaded-model.md`](./redis/module-01-foundations/1.3-single-threaded-model.md)
- [x] 1.4  The RESP protocol → [`redis/module-01-foundations/1.4-resp-protocol.md`](./redis/module-01-foundations/1.4-resp-protocol.md)
- [x] 1.5  The event loop & I/O multiplexing → [`redis/module-01-foundations/1.5-event-loop-io-multiplexing.md`](./redis/module-01-foundations/1.5-event-loop-io-multiplexing.md)

### Module 2 — Data types and their internals
- [x] 2.1  Strings (int / embstr / raw encodings) → [`2.1-strings.md`](./redis/module-02-data-types/2.1-strings.md)
- [x] 2.2  Lists (listpack → quicklist) → [`2.2-lists.md`](./redis/module-02-data-types/2.2-lists.md)
- [x] 2.3  Hashes (listpack → hashtable) → [`2.3-hashes.md`](./redis/module-02-data-types/2.3-hashes.md)
- [x] 2.4  Sets (intset → listpack → hashtable) → [`2.4-sets.md`](./redis/module-02-data-types/2.4-sets.md)
- [x] 2.5  Sorted sets (skiplist + hashtable) → [`2.5-sorted-sets.md`](./redis/module-02-data-types/2.5-sorted-sets.md)
- [ ] 2.6  Streams (entries, IDs, MAXLEN) — *bonus chapter, deferred*
- [ ] 2.7  Specialized: Bitmaps, HyperLogLog, Geo — *bonus chapter, deferred*

### Module 3 — Atomicity & coordination ✅
- [x] 3.1  Execution model & per-command atomicity → [`3.1-execution-model-and-atomicity.md`](./redis/module-03-atomicity-coordination/3.1-execution-model-and-atomicity.md)
- [x] 3.2  Atomic commands (`INCR`, `SET NX`, `HINCRBY`, `LMOVE`, `ZADD GT`) → [`3.2-atomic-commands.md`](./redis/module-03-atomicity-coordination/3.2-atomic-commands.md)
- [x] 3.3  `MULTI / EXEC` — transactions and why there's no rollback → [`3.3-multi-exec.md`](./redis/module-03-atomicity-coordination/3.3-multi-exec.md)
- [x] 3.4  `WATCH` & optimistic CAS → [`3.4-watch-optimistic-cas.md`](./redis/module-03-atomicity-coordination/3.4-watch-optimistic-cas.md)
- [x] 3.5  Lua scripting (`EVAL`, `EVALSHA`, the script cache) → [`3.5-lua-scripting.md`](./redis/module-03-atomicity-coordination/3.5-lua-scripting.md)
- [x] 3.5b 🔧 **Project:** sliding window rate limiter → [`3.5b-project-sliding-window-rate-limiter.md`](./redis/module-03-atomicity-coordination/3.5b-project-sliding-window-rate-limiter.md)
- [x] 3.6  Redis Functions (`FUNCTION LOAD`, `FCALL`) → [`3.6-redis-functions.md`](./redis/module-03-atomicity-coordination/3.6-redis-functions.md)
- [x] 3.7  Pipelining → [`3.7-pipelining.md`](./redis/module-03-atomicity-coordination/3.7-pipelining.md)

> **On 3.8–3.11** (tool comparison, coordination patterns, failure scenarios, performance): folded into 3.1–3.7 rather
> than written separately. The comparison tables live in 3.3/3.5/3.7; coordination patterns — counters, inventory
> reservation, idempotency, rate limiting — are covered in 3.2/3.4/3.5/3.5b; `busy-reply-threshold` and `SCRIPT KILL`
> are in the 3.5 appendix. Crash durability belongs to Module 4 and replica lag to Module 6, where they're taught properly.

### Module 4 — Persistence
- [x] 4.1  RDB snapshots and `fork()` → [`4.1-rdb-snapshots-and-fork.md`](./redis/module-04-persistence/4.1-rdb-snapshots-and-fork.md)
- [ ] 4.2  AOF and fsync policies
- [ ] 4.3  Hybrid persistence
- [ ] 4.4  Backup & recovery patterns

### Module 5 — Memory management
- [ ] 5.1  Encodings & memory layout
- [ ] 5.2  TTL & expiration (active + passive)
- [ ] 5.3  Eviction policies (LRU / LFU / volatile vs allkeys)

### Module 6 — Replication & high availability
- [ ] 6.1  Replication & PSYNC
- [ ] 6.2  Sentinel & automatic failover
- [ ] 6.3  Durability knobs (`min-replicas-to-write`, `WAIT`)

### Module 7 — Cluster (horizontal scale)
- [ ] 7.1  Hash slots & CRC16
- [ ] 7.2  MOVED vs ASK redirects
- [ ] 7.3  Cluster failover (gossip & elections)
- [ ] 7.4  Hash tags & multi-key constraints

### Module 8 — Messaging
- [ ] 8.1  Pub/Sub
- [ ] 8.2  Streams deep dive (consumer groups, PEL, XACK, XCLAIM)
- [ ] 8.3  Streams vs Kafka

### Module 9 — Distributed coordination
- [ ] 9.1  Simple distributed locks (SET NX EX + Lua release)
- [ ] 9.2  Redlock & the Kleppmann critique
- [ ] 9.3  Rate limiting patterns (fixed / sliding / token bucket)

### Module 10 — Caching patterns
- [ ] 10.1 Cache-aside (lazy loading)
- [ ] 10.2 Read-through / write-through / write-behind
- [ ] 10.3 Cache stampede & mitigations
- [ ] 10.4 Hot keys & big keys
- [ ] 10.5 Penetration / breakdown / avalanche

### Module 11 — Operations & wrapping up
- [ ] 11.1 Performance & monitoring (SLOWLOG, LATENCY, INFO, MEMORY)
- [ ] 11.2 Security (ACL, TLS, protected-mode)
- [ ] 11.3 Final mock interview — beginner → senior staff level

---

## How to read these notes

Each lesson is self-contained and structured as:
1. **Mental model** — the one-paragraph intuition.
2. **Commands** — the API you actually type.
3. **Internals** — the data structures and how they evolve.
4. **Config knobs** — what you can tune and why.
5. **Performance** — Big-O and the gotchas.
6. **Patterns & pitfalls** — real-world usage.
7. **Interview drills** — questions from junior → staff level.

> Diagrams are written in Mermaid (renders on GitHub) and ASCII (renders everywhere).
