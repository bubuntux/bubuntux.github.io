# julioguti.dev

Personal site: blog and CV. Built with [Zola](https://www.getzola.org/), the PDF CV with [Typst](https://typst.app/).

## Layout

| Path | What |
|---|---|
| `content/` | Markdown you write: `posts/`, homepage blurb |
| `templates/` | Zola templates; `cv.html` renders `static/resume.json` |
| `static/` | Published as-is: `resume.json`, `img/`, `style.css`, `CNAME` |
| `cv/` | Typst sources: `cv.typ` (PDF CV), `letter.typ`, `metadata.toml` |

## Develop

Tools come from [devenv](https://devenv.sh/) (`devenv shell`); CI uses the same shell.

```sh
devenv shell -- site-serve    # preview at http://127.0.0.1:1111, drafts included
devenv shell -- site-build    # what CI deploys, into public/
devenv shell -- cv-build      # cv/cv.typ -> static/cv.pdf
```

New post: add `content/posts/<slug>.md` with `title` and `date` front matter (`draft = true` keeps it local).

Pushing to `main` deploys via `.github/workflows/gh-pages.yml`.
