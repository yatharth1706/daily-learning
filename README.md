# 🚀 Redis Deep Dive — 11-Module Roadmap

A from-beginner-to-senior-staff journey through Redis. One module per day, in full
detail, with diagrams. Each lesson lives under [`redis/`](./redis/).

> **Currently at:** Module 1 fully done ✅ · Module 2 → **2.1 Strings** + **2.2 Lists** done ✅
> · next up: **2.3 Hashes**

---

## 📚 Progress Tracker

### Module 1 — Foundations: what Redis is and how to talk to it
- [x] 1.1  What is Redis and why it exists → [`redis/module-01-foundations/1.1-what-is-redis.md`](./redis/module-01-foundations/1.1-what-is-redis.md)
- [x] 1.2  Installing & running Redis (Docker, `redis-cli`) → [`redis/module-01-foundations/1.2-installing-and-running.md`](./redis/module-01-foundations/1.2-installing-and-running.md)
- [x] 1.3  The single-threaded mental model → [`redis/module-01-foundations/1.3-single-threaded-model.md`](./redis/module-01-foundations/1.3-single-threaded-model.md)
- [x] 1.4  The RESP protocol → [`redis/module-01-foundations/1.4-resp-protocol.md`](./redis/module-01-foundations/1.4-resp-protocol.md)
- [x] 1.5  The event loop & I/O multiplexing → [`redis/module-01-foundations/1.5-event-loop-io-multiplexing.md`](./redis/module-01-foundations/1.5-event-loop-io-multiplexing.md)

### Module 2 — Data types and their internals
- [x] 2.1  Strings (int / embstr / raw encodings) → [`redis/module-02-data-types/2.1-strings.md`](./redis/module-02-data-types/2.1-strings.md)
- [x] **2.2  Lists (listpack → quicklist)** → [`redis/module-02-data-types/2.2-lists.md`](./redis/module-02-data-types/2.2-lists.md)
- [ ] 2.3  Hashes (listpack → hashtable)
- [ ] 2.4  Sets (intset → listpack → hashtable)
- [ ] 2.5  Sorted sets (skiplist + hashtable)
- [ ] 2.6  Streams (entries, IDs, MAXLEN)
- [ ] 2.7  Specialized: Bitmaps, HyperLogLog, Geo

### Module 3 — Atomicity & coordination
- [ ] 3.1  Per-command atomicity
- [ ] 3.2  `MULTI / EXEC`
- [ ] 3.3  `WATCH` and optimistic CAS
- [ ] 3.4  Lua scripts (`EVAL`) and server-side functions
- [ ] 3.5  Pipelining

### Module 4 — Persistence
- [ ] 4.1  RDB snapshots and `fork()`
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
