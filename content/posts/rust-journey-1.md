+++
title = "Rust journey, part 1: making the move"
date = 2026-10-19
description = "Why I want to move into Rust, and my plan to get there."

[taxonomies]
tags = ["rust", "learning", "career", "rust-journey"]
+++

I've wanted to move into Rust for a while now, and so far it hasn't happened. I've built things with it on the side, but it's never become part of my day job. This post is me writing down why I care about it and laying out a concrete path to make it a reality.

<!-- more -->

## Why Rust

Rust was voted the most loved language in Stack Overflow's developer survey every year from [2016](https://stackoverflow.blog/2020/06/05/why-the-developers-who-use-rust-love-it-so-much/) to [2022](https://survey.stackoverflow.co/2022/), and kept the top spot when the category was renamed "most admired" in [2023](https://survey.stackoverflow.co/2023/), [2024](https://survey.stackoverflow.co/2024/technology) and [2025](https://survey.stackoverflow.co/2025/technology). A streak that long makes me think there's something real behind the hype.

The memory management is what got me curious. Most languages either use a garbage collector or make you allocate and free memory yourself. Rust does neither. It uses ownership rules that the compiler checks before your code ever runs. That's a completely different way of thinking about it, and I want to understand it.

I also like strictly typed languages, and Rust feels like the most serious take on that I've seen. And I think AI makes that matter more, not less. When an agent writes code, a strict type system and a good compiler act like a reviewer that never gets tired: the code either compiles, or the compiler tells you exactly what's wrong and often how to fix it. Rust's compiler is known for having some of the best error messages around. I think strongly typed languages with compilers like that are where things are heading.

And it's built for the work I like: low-level code, CLI tools, things where performance matters. That's the space I enjoy most and where I feel I'm good, so learning Rust feels like a natural fit. It's not a niche bet anymore either. Big companies are moving to it:

- **Microsoft** made Rust a [Tier-1 language internally](https://www.infoworld.com/article/4227839/microsoft-doubles-down-on-rust.html), alongside C# and TypeScript.
- **Google** has about 5 million lines of Rust in Android, and memory safety bugs have dropped [below 20% of its vulnerabilities](https://blog.google/security/rust-in-android-move-fast-fix-things/) for the first time.
- **Meta** made Rust an [officially supported server-side language](https://engineering.fb.com/2022/07/27/developer-tools/programming-languages-endorsed-for-server-side-use-at-meta/), recommended for performance-sensitive back-end services and CLI tools.
- **AWS** built [Firecracker](https://aws.amazon.com/blogs/opensource/sustainability-with-rust/), the virtualization tech behind Lambda, in Rust.
- **Cloudflare** replaced its NGINX-based core proxy with [one written in Rust](https://blog.cloudflare.com/20-percent-internet-upgrade/).
- Even the **Linux kernel** declared its Rust support [no longer experimental](https://thenewstack.io/rust-goes-mainstream-in-the-linux-kernel/).

## My goal

I want to get good enough at Rust to use it every day, professionally. That breaks down into:

- **Learn the ins and outs of the language.** Not just enough to get something compiling, but really understand how it works.
- **Use it in all my personal and toy projects.** That's where I'll get the hours in.
- **Get a job where I use it daily** and start building real professional experience with it.

There's no official Rust certification, so I'm not chasing a piece of paper. Projects I can point to and day-to-day experience will have to speak for themselves.

## What I've built so far

- **JUPR**, written entirely by hand, no AI assistance. It tracks pickleball ratings for my group: games come in through a WhatsApp bot, and it keeps everyone's rating up to date. It's an actix-web API with SeaORM on Postgres, about 1,800 lines so far. It's the longer-term, more general version of [whatsapp_to_dupr](https://github.com/bubuntux/whatsapp_to_dupr), a smaller tool that moves our games from WhatsApp messages into [DUPR](https://www.dupr.com/).
- **[tabletty](https://github.com/bubuntux/tabletty)**, built with AI assistance. It lets you play tabletop games in the terminal, peer-to-peer, with each game running as a sandboxed WebAssembly plugin.

## Resources I'm using

- [The Rust Programming Language](https://doc.rust-lang.org/book/), a.k.a. "the book." The official guide, and where everyone starts.
- [Rustlings](https://rustlings.rust-lang.org/), small exercises that get you reading and fixing Rust code.
- [RustCurious](https://rustcurious.com/), a video course on the language.
- [Exercism's Rust track](https://exercism.org/tracks/rust), for practice problems.
- [LeetCode](https://leetcode.com/), solving problems in Rust instead of my usual languages.

## Next steps

- Keep going with tabletty.
- Keep up with the exercises and the RustCurious course.
- Get Rust into my day job. We have a Rust guild at work, and I've tried to pick up Rust tickets through it before with no success. This time I'll go straight to the teams that use Rust and look for small, easy tickets, to build some momentum and earn the team's trust.
