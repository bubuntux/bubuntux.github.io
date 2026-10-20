+++
# Copy this file to start a post. Everything below is optional except `title`
# and `date`. Full list: https://www.getzola.org/documentation/content/page/#front-matter

# Shown as the page heading, in the post list, browser tab and link previews.
title = "Hello, world"
# Sorts the home page and dates the feed entry. A date, or a full datetime.
date = 2026-10-18
# Last edit; feeds and the sitemap use it, the post page doesn't show it.
updated = 2026-10-20T10:00:00-05:00
# Meta description and link-preview text; falls back to the site description.
description = "Example post showing every front matter field and Markdown feature."
# Drafts only render under `site-serve` (`zola serve --drafts`), never in production.
draft = true
# Feed entry author; defaults to `author` in config.toml.
authors = ["Julio Gutierrez"]
# URL is /posts/<slug>/; defaults to the file name.
# slug = "hello-world"
# Old URLs that should redirect here, e.g. after renaming the file.
# aliases = ["/posts/old-name/"]
# Set to false to keep the page out of the search index (not built on this site yet).
# in_search_index = true

# Tags get pages under /tags/<tag>/, show on the home page, and have their own feed.
[taxonomies]
tags = ["meta"]

# Free-form values for templates (`page.extra.*`).
[extra]
# Link-preview image, a path under static/ (no leading slash). Without it the preview has none.
# image = "img/posts/hello-world.png"
+++

The text before the `more` marker is the summary shown on the home page and tag
pages, followed by a "Read more" link. Without the marker, the list shows only
the title.

<!-- more -->

## Headings

Use `##` and below; the post title is already the `#` heading. Every heading gets
an anchor id from its text, or set one yourself.

### A custom id {#custom-id}

Link to it with [`#custom-id`](#custom-id).

## Text

**Bold**, *italic*, ~~strikethrough~~ and `inline code`. Smart punctuation is on,
so "quotes", 'apostrophes', dashes -- and --- and ellipses... come out typographic.

> A blockquote, for quoting someone else.

A footnote reference.[^1]

[^1]: The footnote text, rendered where it's written, not at the end of the post.

## Links

- External: [Zola docs](https://www.getzola.org/documentation/)
- Another post, checked at build time: [Rust journey, part 1](@/posts/rust-journey-1.md)
- A heading in another post: [Why Rust](@/posts/rust-journey-1.md#why-rust)
- A site page: [the CV](@/cv/_index.md)

## Lists

1. Ordered
2. List
   - Nested
   - Bullets

- [x] Task lists
- [ ] work too

## Code

```rust
fn main() {
    println!("Hello, world!");
}
```

## Tables

| Column | Aligned right |
|--------|--------------:|
| a      |             1 |
| b      |            22 |

## Images

Files in `static/` are served from the site root:

![The avatar from static/img/avatar.png](/img/avatar.png)

## Horizontal rule

---

That's everything.
