{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:

let
  # Fonts cv/cv.typ and brilliant-cv ask for (see cv/metadata.toml).
  cvFonts = [
    pkgs.roboto
    pkgs.source-sans
    pkgs.font-awesome
  ];
in
{
  # devenv.cachix.org is already in the system /etc/nix/nix.conf, so tell
  # devenv not to auto-configure it. Silences the "Substituter ... is already
  # present" warning on shell entry; the cache still works via the system config.
  cachix.enable = false;

  packages = [
    pkgs.zola # static site generator for the blog, portfolio and HTML CV
    pkgs.typst # compiles cv/cv.typ and cv/letter.typ to PDF
  ];

  # Typst only sees these fonts because cv-build passes --ignore-system-fonts,
  # so the PDF renders the same here as in CI.
  env.TYPST_FONT_PATHS = lib.concatMapStringsSep ":" (font: "${font}/share/fonts") cvFonts;

  # Compile the CV to static/cv.pdf, where `zola serve` and `zola build` pick it
  # up. Missing fonts are only warnings in Typst and silently fall back to
  # another typeface, so any warning fails the build.
  scripts.cv-build.exec = ''
    set -euo pipefail
    cd "$DEVENV_ROOT"
    log="$(mktemp)"
    trap 'rm -f "$log"' EXIT
    typst compile --root . --ignore-system-fonts --diagnostic-format short \
      cv/cv.typ static/cv.pdf 2> "$log" || { cat "$log" >&2; exit 1; }
    if grep -q warning "$log"; then
      cat "$log" >&2
      echo "error: typst emitted warnings; refusing to keep the PDF" >&2
      rm -f static/cv.pdf
      exit 1
    fi
    echo "static/cv.pdf"
  '';

  scripts.letter-build.exec = ''
    set -euo pipefail
    cd "$DEVENV_ROOT"
    typst compile --root . --ignore-system-fonts cv/letter.typ cv/letter.pdf
    echo "cv/letter.pdf"
  '';

  # What CI deploys: the CV PDF first so zola copies it into public/.
  scripts.site-build.exec = ''
    set -euo pipefail
    cd "$DEVENV_ROOT"
    cv-build
    zola build "$@"
  '';

  scripts.site-serve.exec = ''
    set -euo pipefail
    cd "$DEVENV_ROOT"
    cv-build
    zola serve --drafts "$@"
  '';

  enterShell = ''
    echo "bubuntux.github.io devenv ready:"
    echo "  $(zola --version)"
    echo "  $(typst --version)"
    echo
    echo "  site-build      build the CV PDF and the site into public/ (what CI deploys)"
    echo "  site-serve      build the CV PDF, then preview at http://127.0.0.1:1111 (drafts included)"
    echo "  cv-build        cv/cv.typ -> static/cv.pdf"
    echo "  letter-build    cv/letter.typ -> cv/letter.pdf"
  '';
}
